<?php 
   session_start();
   if(!isset($_SESSION['username']) or ($_SESSION['phanquyen']==1))
   {		
		header('location:login.php');
		exit();
   }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Trang quản trị hệ thống</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link href="./index.css" rel="stylesheet">
    </head>
    <body>
    <div class="main">
        <div class="banner"></div>
        <div class="menu-ngang">
            <p style="padding-right: 30px; float: right; ">Chào bạn <font color="red"><b><?= $_SESSION['username']?></b></font><a href="logout.php" style="color: white"> | Thoát</a></p>
        </div>
        <div class="conten">
            <div class="left">
                <div class="qunly">
                    <h3>Quản lý</h3>
                    <ul>
                        <li><a href="index.php">Trang chủ</a></li>
                        <li><a href="?admin=sanpham">Danh mục sản phẩm</a></li>
                        <li><a href="?admin=donhang">Quản lý đơn hàng</a></li>
                        <li><a href="?admin=loai">Danh mục loại</a></li>
                        <li><a href="?admin=hang">Danh mục hãng</a></li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <?php 
                    include('./conten_admin.php');
                ?>
            </div>
        </div>

    </div>
    </body>
</html>