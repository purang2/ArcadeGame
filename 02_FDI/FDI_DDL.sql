use team5;

-- [틀린그림찾기] 이미지 번호와 난이도 저장 테이블
create table FDI_image (
    image_number int primary key,
    difficult varchar(20)
);
-- [틀린그림찾기] 이미지 번호에 따른 정답 좌표 테이블
create table FDI_image_diff_axis (
     image_number int,
     x int,
     y int,
     size int,
     foreign key(image_number)
     references FDI_image(image_number) on update cascade
);

insert into FDI_image values (1, "easy");
insert into FDI_image values (2, "normal");
insert into FDI_image values (3, "hard");
insert into FDI_image values (4, "easy");
insert into FDI_image values (5, "normal");
insert into FDI_image values (6, "easy");
insert into FDI_image values (7, "normal");
insert into FDI_image values (8, "easy");
insert into FDI_image values (9, "hard");
insert into FDI_image values (10, "hard");
insert into FDI_image values (11, "hard");

delete from FDI_image_diff_axis where image_number = 1;
insert into FDI_image_diff_axis values (1, 46, 74, 40);
insert into FDI_image_diff_axis values (1, 364, 66, 40);
insert into FDI_image_diff_axis values (1, 257, 129, 40);
insert into FDI_image_diff_axis values (1, 408, 172, 40);
insert into FDI_image_diff_axis values (1, 2, 289, 40);
insert into FDI_image_diff_axis values (1, 206, 390, 40);
insert into FDI_image_diff_axis values (1, 264, 364, 40);

delete from FDI_image_diff_axis where image_number = 2;
insert into FDI_image_diff_axis values (2, 150, 100, 120);
insert into FDI_image_diff_axis values (2, 113, 90, 40);
insert into FDI_image_diff_axis values (2, 275, 230, 40);
insert into FDI_image_diff_axis values (2, 390, 180, 90);
insert into FDI_image_diff_axis values (2, 215, 425, 70);
insert into FDI_image_diff_axis values (2, 277, 508, 40);
insert into FDI_image_diff_axis values (2, 290, 460, 40);
insert into FDI_image_diff_axis values (2, 332, 155, 40);
insert into FDI_image_diff_axis values (2, 85, 142, 50);
insert into FDI_image_diff_axis values (2, 16, 256, 50);
insert into FDI_image_diff_axis values (2, 117, 180, 80);
insert into FDI_image_diff_axis values (2, 71, 190, 40);

delete from FDI_image_diff_axis where image_number = 3;
insert into FDI_image_diff_axis values (3, 368, 75, 40);
insert into FDI_image_diff_axis values (3, 210, 90, 40);
insert into FDI_image_diff_axis values (3, 330, 140, 40);
insert into FDI_image_diff_axis values (3, 333, 200, 40);
insert into FDI_image_diff_axis values (3, 155, 185, 40);
insert into FDI_image_diff_axis values (3, 110, 210, 40);
insert into FDI_image_diff_axis values (3, 28, 185, 40);
insert into FDI_image_diff_axis values (3, 156, 50, 40);
insert into FDI_image_diff_axis values (3, 188, 100, 40);
insert into FDI_image_diff_axis values (3, 277, 130, 40);

delete from FDI_image_diff_axis where image_number = 4;
insert into FDI_image_diff_axis values (4, 205, 27, 100);
insert into FDI_image_diff_axis values (4, 72, 360, 100);
insert into FDI_image_diff_axis values (4, 249, 370, 120);
insert into FDI_image_diff_axis values (4, 95, 190, 80);
insert into FDI_image_diff_axis values (4, 72, 64, 50);

delete from FDI_image_diff_axis where image_number = 5;
insert into FDI_image_diff_axis values (5, 25, 5, 70);
insert into FDI_image_diff_axis values (5, 30, 157, 70);
insert into FDI_image_diff_axis values (5, 320, 280, 50);
insert into FDI_image_diff_axis values (5, 138, 153, 80);
insert into FDI_image_diff_axis values (5, 100, 245, 50);
insert into FDI_image_diff_axis values (5, 295, 135, 100);
insert into FDI_image_diff_axis values (5, 400, 330, 50);

delete from FDI_image_diff_axis where image_number = 6;
insert into FDI_image_diff_axis values (6, 310, 15, 40);
insert into FDI_image_diff_axis values (6, 340, 70, 40);
insert into FDI_image_diff_axis values (6, 370, 153, 50);
insert into FDI_image_diff_axis values (6, 50, 180, 80);
insert into FDI_image_diff_axis values (6, 110, 120, 80);

delete from FDI_image_diff_axis where image_number = 7;
insert into FDI_image_diff_axis values (7, 127, 17, 40);
insert into FDI_image_diff_axis values (7, 64, 74, 40);
insert into FDI_image_diff_axis values (7, 133, 69, 40);
insert into FDI_image_diff_axis values (7, 255, 245, 40);
insert into FDI_image_diff_axis values (7, 350, 210, 40);
insert into FDI_image_diff_axis values (7, 275, 170, 50);
insert into FDI_image_diff_axis values (7, 90, 210, 50);

delete from FDI_image_diff_axis where image_number = 8;
insert into FDI_image_diff_axis values (8, 170, 461, 60);
insert into FDI_image_diff_axis values (8, 280, 490, 120);
insert into FDI_image_diff_axis values (8, 394, 510, 60);
insert into FDI_image_diff_axis values (8, 260, 150, 50);
insert into FDI_image_diff_axis values (8, 380, 565, 40);

delete from FDI_image_diff_axis where image_number = 9;
insert into FDI_image_diff_axis values (9, 288, 35, 40);
insert into FDI_image_diff_axis values (9, 145, 24, 30);
insert into FDI_image_diff_axis values (9, 50, 30, 50);
insert into FDI_image_diff_axis values (9, 10, 80, 80);
insert into FDI_image_diff_axis values (9, 400, 201, 70);
insert into FDI_image_diff_axis values (9, 373, 148, 40);
insert into FDI_image_diff_axis values (9, 227, 260, 50);
insert into FDI_image_diff_axis values (9, 200, 77, 50);

delete from FDI_image_diff_axis where image_number = 10;
insert into FDI_image_diff_axis values (10, 267, 47, 40);
insert into FDI_image_diff_axis values (10, 77, 15, 50);
insert into FDI_image_diff_axis values (10, 119, 117, 40);
insert into FDI_image_diff_axis values (10, 12, 96, 40);
insert into FDI_image_diff_axis values (10, 70, 285, 40);
insert into FDI_image_diff_axis values (10, 172, 196, 40);
insert into FDI_image_diff_axis values (10, 355, 164, 40);
insert into FDI_image_diff_axis values (10, 406, 165, 70);
insert into FDI_image_diff_axis values (10, 250, 260, 40);
insert into FDI_image_diff_axis values (10, 222, 200, 40);

delete from FDI_image_diff_axis where image_number = 11;
insert into FDI_image_diff_axis values (11, 7, 0, 80);
insert into FDI_image_diff_axis values (11, 55, 68, 40);
insert into FDI_image_diff_axis values (11, 92, 172, 40);
insert into FDI_image_diff_axis values (11, 60, 260, 50);
insert into FDI_image_diff_axis values (11, 157, 222, 50);
insert into FDI_image_diff_axis values (11, 202, 227, 70);
insert into FDI_image_diff_axis values (11, 395, 260, 50);
insert into FDI_image_diff_axis values (11, 298, 168, 60);
insert into FDI_image_diff_axis values (11, 175, 110, 100);
insert into FDI_image_diff_axis values (11, 132, 30, 40);
insert into FDI_image_diff_axis values (11, 413, 25, 50);
insert into FDI_image_diff_axis values (11, 365, 100, 60);
insert into FDI_image_diff_axis values (11, 320, 133, 40);
insert into FDI_image_diff_axis values (11, 393, 185, 50);
insert into FDI_image_diff_axis values (11, 311, 62, 40);