<?php
include 'connet.php';
$sql = "SELECT * FROM loaisp";
$kq = mysqli_query($con, $sql);
if(mysqli_num_rows($kq)>0){
    while($row=mysqli_fetch_array($kq)){
        ?>
        <li><a href="./index.php?loaisp=loai&idloai=<?php echo $row['IDLoaiSP'] ?>"><?php echo $row['TenLoai'];?></a></li>
        <?php
    }
}
?>