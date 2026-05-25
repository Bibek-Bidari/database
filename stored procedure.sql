
create database college_notice_board;

use college_notice_board;


create table users (
    user_id int auto_increment primary key,
    username varchar(100) unique not null,
    user_password varchar(100) not null,
    role enum('teacher', 'student') not null
);


create table notices (
    notice_id int auto_increment primary key,
    title varchar(255) not null,
    content text not null,
    created_by int,
    created_at timestamp default current_timestamp,

    foreign key (created_by) references users(user_id)
);


delimiter $$

create procedure registeruser(
    in p_username varchar(100),
    in p_password varchar(100),
    in p_role varchar(20)
)
begin

    -- check valid role
    if p_role not in ('teacher', 'student') then
        signal sqlstate '45000'
        set message_text = 'invalid role. only teacher or student allowed.';
    else
        insert into users(username, user_password, role)
        values(p_username, p_password, p_role);

        select 'user registered successfully' as message;
    end if;

end $$

delimiter ;


delimiter $$

create procedure userlogin(
    in p_username varchar(100),
    in p_password varchar(100)
)
begin

    select user_id, username, role
    from users
    where username = p_username
    and user_password = p_password;

end $$

delimiter ;


delimiter $$

create procedure checkpermission(
    in p_user_id int
)
begin

    declare user_role varchar(20);

    -- get user role
    select role into user_role
    from users
    where user_id = p_user_id;

    -- check if user is teacher
    if user_role != 'teacher' then
        signal sqlstate '45000'
        set message_text = 'permission denied. only teachers can perform this action.';
    end if;

end $$

delimiter ;


delimiter $$

create procedure createnotice(
    in p_title varchar(255),
    in p_content text,
    in p_created_by int
)
begin

    -- check permission
    call checkpermission(p_created_by);

    -- insert notice
    insert into notices(title, content, created_by)
    values(p_title, p_content, p_created_by);

    select 'notice created successfully' as message;

end $$

delimiter ;


delimiter $$

create procedure viewnotices()
begin

    select 
        n.notice_id,
        n.title,
        n.content,
        u.username as created_by,
        n.created_at
    from notices n
    join users u
    on n.created_by = u.user_id
    order by n.created_at desc;

end $$

delimiter ;


delimiter $$

create procedure updatenotice(
    in p_notice_id int,
    in p_new_title varchar(255),
    in p_new_content text,
    in p_user_id int
)
begin

    -- check permission
    call checkpermission(p_user_id);

    -- update notice
    update notices
    set title = p_new_title,
        content = p_new_content
    where notice_id = p_notice_id;

    select 'notice updated successfully' as message;

end $$

delimiter ;


delimiter $$

create procedure deletenotice(
    in p_notice_id int,
    in p_user_id int
)
begin

    -- check permission
    call checkpermission(p_user_id);

    -- delete notice
    delete from notices
    where notice_id = p_notice_id;

    select 'notice deleted successfully' as message;

end $$

delimiter ;




call registeruser('bibek', 'Hello123', 'teacher');


call registeruser('ram', 'ram123', 'student');


call userlogin('bibek', 'Hello123');


call userlogin('ram', 'ram123');


call createnotice(
    'exam notice',
    'mid-term exams start next monday.',
    1
);


call viewnotices();


call updatenotice(
    1,
    'updated exam notice',
    'mid-term exams start from tuesday.',
    1
);


call viewnotices();


call deletenotice(
    1,
    1
);

call viewnotices();



call createnotice(
    'fake notice',
    'students should not create notices.',
    2
);