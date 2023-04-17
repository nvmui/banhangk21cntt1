<?php
include 'connet.php';
$sql = "SELECT * FROM hangsanxuat";
$kq = mysqli_query($con, $sql);
if(mysqli_num_rows($kq)>0){
    while($row=mysqli_fetch_array($kq)){
        ?>
        <li><a href="#"><?php echo $row['TenHang']?></a></li>
        <?php
    }
}
?>