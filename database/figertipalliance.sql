-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2024-04-08 15:05:42
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `figertipalliance`
--

-- --------------------------------------------------------

--
-- 表的结构 `allorder`
--

CREATE TABLE `allorder` (
  `id` int(11) NOT NULL,
  `num` text NOT NULL,
  `status` text NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `descs` text NOT NULL,
  `price` text NOT NULL,
  `ordernum` text NOT NULL,
  `totalnum` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `allorder`
--

INSERT INTO `allorder` (`id`, `num`, `status`, `image`, `title`, `descs`, `price`, `ordernum`, `totalnum`) VALUES
(1, '20180205011232', '1', 'http://iwenwiki.com/FingertipAlliance/images/goods1.webp', '北欧甲油胶全色', 'Gelartist底胶免洗磨砂封层擦洗封层加固胶美甲功能胶甲油胶', '12.00', '2', '27'),
(2, '20240205011200', '2', 'http://iwenwiki.com/FingertipAlliance/images/goods2.webp', '北欧甲油胶全色', '西城美甲店铺转让位于东城区东四地铁站附近盈利美甲店', '20.00', '3', '10'),
(3, '20240205000112', '3', 'http://iwenwiki.com/FingertipAlliance/images/goods3.webp', '大溪地牛肉', '眼睛明亮如星辰，深邃无比；嘴唇娇嫩如花瓣，让人心醉神迷。', '40.00', '3', '13');

-- --------------------------------------------------------

--
-- 表的结构 `beauty`
--

CREATE TABLE `beauty` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `descs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `beauty`
--

INSERT INTO `beauty` (`id`, `image`, `title`, `descs`) VALUES
(1, 'http://iwenwiki.com/FingertipAlliance/images/m1.webp', '蓝月亮 健康洗手液 5kg', '蓝月亮 健康洗手液5kg大桶补充装 配方温和 家庭酒店车间可用 10斤装'),
(2, 'http://iwenwiki.com/FingertipAlliance/images/m2.webp', '麒麟西瓜', '麒麟西瓜真的很好吃，皮薄，甜美'),
(3, 'http://iwenwiki.com/FingertipAlliance/images/m3.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(4, 'http://iwenwiki.com/FingertipAlliance/images/m4.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(5, 'http://iwenwiki.com/FingertipAlliance/images/m5.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(6, 'http://iwenwiki.com/FingertipAlliance/images/m6.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(7, 'http://iwenwiki.com/FingertipAlliance/images/m7.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(8, 'http://iwenwiki.com/FingertipAlliance/images/m8.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(9, 'http://iwenwiki.com/FingertipAlliance/images/m9.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(10, 'http://iwenwiki.com/FingertipAlliance/images/m10.webp', '以梦为马，不负韶华', '都是第一次为人，凭什么我要让着你'),
(11, 'http://iwenwiki.com/FingertipAlliance/images/m1.webp', '以梦为马，不负韶华2', '都是第一次为人，凭什么我要让着你2'),
(12, 'http://iwenwiki.com/FingertipAlliance/images/m2.webp', '以梦为马，不负韶华2', '都是第一次为人，凭什么我要让着你2'),
(13, 'http://iwenwiki.com/FingertipAlliance/images/m3.webp', '以梦为马，不负韶华2', '都是第一次为人，凭什么我要让着你2');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `icon` text NOT NULL,
  `name` text NOT NULL,
  `rate` int(11) NOT NULL,
  `time` text NOT NULL,
  `text` text NOT NULL,
  `images` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `icon`, `name`, `rate`, `time`, `text`, `images`) VALUES
(1, 'http://iwenwiki.com/FingertipAlliance/images/icon1.png', 'iwenwiki', 4, '01月06日 15:49', '好评好评！这真的是一款好产品，不管是颜色还是价格都很好，强烈建议大家购买！', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(2, 'http://iwenwiki.com/FingertipAlliance/images/icon2.png', '大葫芦', 5, '01月06日 15:49', '既然是靠时间忘却的人，想必也是经过了一段很长的时间，那么为什么还要思念，和自己较劲，还要再次寒暄。', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(3, 'http://iwenwiki.com/FingertipAlliance/images/icon3.png', '赛迪', 3, '01月06日 15:49', '两位初次合作带来歌曲舞台《不如见一面》，依纯细腻独特的嗓音温柔极了，真的很治愈，搭配海来阿木老师深情又层次丰富的嗓音，这首歌真的是天籁之声~', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(4, 'http://iwenwiki.com/FingertipAlliance/images/icon4.png', '老四', 3, '01月06日 15:49', '不如见一面，哪怕是一眼，这首歌唱出了一对曾经的恋人对过去感情的思念和恋恋不舍，爱情就是这样，从来都是不正常的，克制不住的才是爱，不清醒的才是爱，情不自禁，不由自主的才是爱，失魂落魄的才是爱。情人节，愿有情人终成眷属。', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(5, 'http://iwenwiki.com/FingertipAlliance/images/icon5.png', 'Sail', 5, '01月06日 15:49', '大声告诉我，歌手界不能缺少谁!', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(6, 'http://iwenwiki.com/FingertipAlliance/images/icon6.png', 'helloword', 4, '01月06日 15:49', '相见时难别亦难 东风无力百花残\r\n春蚕到死丝方尽 蜡炬成灰泪始干\r\n晓镜但愁云鬓改 夜吟应觉月光寒\r\n蓬山此去无多路 青鸟殷勤为探看', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp'),
(7, 'http://iwenwiki.com/FingertipAlliance/images/icon7.png', '老李', 5, '01月06日 15:49', '啊啊啊录音棚版的不如见一面 我来啦', 'http://localhost:3000/images/goods1.webp,http://localhost:3000/images/goods2.webp,http://localhost:3000/images/goods3.webp,http://localhost:3000/images/goods4.webp');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `price` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `image`, `title`, `price`) VALUES
(1, 'http://iwenwiki.com/FingertipAlliance/images/goods1.webp', '北欧甲油胶全色（店铺七折专享卡）', '12'),
(2, 'http://iwenwiki.com/FingertipAlliance/images/goods2.webp', '北欧甲油胶全色（店铺七折专享卡）', '13'),
(3, 'http://iwenwiki.com/FingertipAlliance/images/goods3.webp', '北欧甲油胶全色（店铺七折专享卡）', '14'),
(4, 'http://iwenwiki.com/FingertipAlliance/images/goods4.webp', '北欧甲油胶全色（店铺七折专享卡）', '15');

-- --------------------------------------------------------

--
-- 表的结构 `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `name` text NOT NULL,
  `age` text NOT NULL,
  `price` text NOT NULL,
  `descs` text NOT NULL,
  `sex` text NOT NULL,
  `birthday` text NOT NULL,
  `education` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `person`
--

INSERT INTO `person` (`id`, `image`, `name`, `age`, `price`, `descs`, `sex`, `birthday`, `education`) VALUES
(1, 'http://iwenwiki.com/FingertipAlliance/images/z1.png', '菲絮', '3-5', '10000', '眼睛明亮如星辰，深邃无比；嘴唇娇嫩如花瓣，让人心醉神迷。', '女', '1995-01', '本科'),
(2, 'http://iwenwiki.com/FingertipAlliance/images/z2.png', '梦瑶瑶', '2-5', '12000', '眼睛犹如碧波荡漾，灵动有神；嘴唇上扬，自信的笑容让人心生向往。', '女', '1996-01', '硕士'),
(3, 'http://iwenwiki.com/FingertipAlliance/images/z3.png', '婉婷', '3-5', '13000', '心地善良、乐于助人、智慧过人，这一切都让她成为众人瞩目的焦点。', '女', '1997-01', '博士'),
(4, 'http://iwenwiki.com/FingertipAlliance/images/z4.png\r\n', '睿婕', '3-5', '10000', '眼睛明亮如星辰，深邃无比；嘴唇娇嫩如花瓣，让人心醉神迷', '女', '1998-01', '专科'),
(5, 'http://iwenwiki.com/FingertipAlliance/images/z5.png\r\n', '雅琳', '3-5', '10000', '眼睛犹如碧波荡漾，灵动有神；嘴唇上扬，自信的笑容让人心生向往', '女', '1999-01', '博士'),
(6, 'http://iwenwiki.com/FingertipAlliance/images/z6.png\r\n', '静琪', '2-5', '12000', '心地善良、乐于助人、智慧过人，这一切都让她成为众人瞩目的焦点。', '女', '1995-01', '双博士'),
(7, 'http://iwenwiki.com/FingertipAlliance/images/z7.png\r\n', '彦妮彦', '2-5', '10000', '眼睛明亮如星辰，深邃无比；嘴唇娇嫩如花瓣，让人心醉神迷。', '女', '1995-01', '本科'),
(8, 'http://iwenwiki.com/FingertipAlliance/images/z8.png', '馨蕊馨', '3-5', '10000', '眼睛明亮如星辰，深邃无比；嘴唇娇嫩如花瓣，让人心醉神迷。', '女', '2000-01', '本科'),
(9, 'http://iwenwiki.com/FingertipAlliance/images/z9.png', '静宸宸', '3-5', '12000', '眼睛犹如碧波荡漾，灵动有神；嘴唇上扬，自信的笑容让人心生向往。', '女', '1994-01', '博士'),
(10, 'http://iwenwiki.com/FingertipAlliance/images/z10.png\r\n', '乐姗姗', '2-5', '13000', '心地善良、乐于助人、智慧过人，这一切都让她成为众人瞩目的焦点。', '女', '1995-03', '硕士');

-- --------------------------------------------------------

--
-- 表的结构 `place`
--

CREATE TABLE `place` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `descs` text NOT NULL,
  `price` text NOT NULL,
  `afee` text NOT NULL,
  `size` text NOT NULL,
  `location` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `place`
--

INSERT INTO `place` (`id`, `image`, `title`, `descs`, `price`, `afee`, `size`, `location`) VALUES
(1, 'http://iwenwiki.com/FingertipAlliance/images/shop1.jpg', '东城美甲店铺转让位于东城区东四地铁站附近盈利美甲店', '一层/25㎡/社区住宅底商', '10000', '面议', '50m²', '北京市石景山区鲁谷东大街'),
(2, 'http://iwenwiki.com/FingertipAlliance/images/shop2.jpg', '西城美甲店铺转让位于东城区东四地铁站附近盈利美甲店', '一层/25㎡/社区住宅底商', '12000', '面议', '60m²', '北京市丰台区区鲁谷东大街'),
(3, 'http://iwenwiki.com/FingertipAlliance/images/shop3.jpg', '南城美甲店铺转让位于东城区东四地铁站附近盈利美甲店', '一层/25㎡/社区住宅底商', '8000', '面议', '70m²', '北京市石景山区鲁谷西大街');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `phone` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `phone`) VALUES
(1, 'iwenwiki', '123456', '18866886688'),
(2, '', '123456', '13344445555'),
(3, '', '123456', '19988887777');

--
-- 转储表的索引
--

--
-- 表的索引 `allorder`
--
ALTER TABLE `allorder`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `beauty`
--
ALTER TABLE `beauty`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `allorder`
--
ALTER TABLE `allorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `beauty`
--
ALTER TABLE `beauty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `place`
--
ALTER TABLE `place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
