<?php
    include './connet.php';
    if ($action = "insert") {
        $phuongthuc = $_POST['phuongthuc'];
        $ngay = date('Y-m-d');
        $idnd = $_SESSION['idnd'];
        $sql1 = "INSERT INTO hoadonban(IDKhachHang, NgayBan, NoiDung, phuongthuc) VALUES ('$idnd', '$ngay','Khách đặt hàng','$phuongthuc')";
        mysqli_query($con, $sql1);
        $mahd = mysqli_insert_id($con);
        foreach ($_SESSION['cart'] as $id => $value) {
            // $sql = "select * from sanpham where IDSanPham = $stt";
            // $rows = mysqli_query($con,$sql);
            // $row = mysqli_fetch_array($rows);
            $sl = $value['sl'];
            $gia = $value['price'];
            //echo $value." ".$mahd;
            $sql2 = "INSERT INTO chitiethd(IDHDB, IDSanPham, SoLuong, DonGia) values('$mahd','$id','$sl','$gia')";
            mysqli_query($con, $sql2);
        }
        unset($_SESSION['cart']);
        echo "
        <script language='javascript'>
            alert('Đơn hàng của bạn đã thiết lập thành công chúng tôi sẽ chuyển hàng cho bạn trong thời gian sớm nhất');
            window.open('index.php','_self',3);
        </script>";            
    }
?>