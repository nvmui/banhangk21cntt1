<link rel="stylesheet" href="css/hienthi_sp.css">
<?php
    include '../connet.php';
    $madh = $_GET['madh'];
    $select = "SELECT * FROM sanpham sp INNER JOIN chitiethd ctdh ON ctdh.IDSanPham = sp.IDSanPham where ctdh.IDHDB='.$madh.'";
    $query = mysqli_query($con, $select);
    $dem = mysqli_num_rows($query);
    $sql1="SELECT * FROM hoadonban dh INNER JOIN khachhang nd ON dh.IDKhachHang = nd.IDKhachHang where IDHDB='$madh'";
    $rows1 = mysqli_query($con, $sql1);
    $row1 = mysqli_fetch_array($rows1);
?>
<div class="quanlysp" >
    <h3>CHI TIẾT ĐƠN HÀNG</h3>
    <?php 
        echo "Tên khách hàng: ".$row1['TenKH']; echo "</br>";
        echo "Địa chỉ: ".$row1['DiaChi']." "; echo "</br>";
        echo "Điện thoại: 0".$row1['SDT']; echo "</br>";
        echo "Ngày giao hàng: ".date("d/m/Y"); echo "</br>";
        echo "Phương thức thanh toán: "; 
        if($row1['phuongthuc']==1) 
        echo "Qua bưu điện"; 
        else if($row1['phuongthuc']==2) echo "Qua thẻ ATM"; 
        else echo"Thanh toán trực tiếp";
    ?>
</div>
<table>    
    <tr class='tieude_hienthi_sp'>
        <td>STT</td>
        <td>Mã HD</td>
        <td>Tên sản phẩm</td>
        <td>Số lượng</td>
        <td>Giá</td>
        <td>Thành tiền</td>
    </tr>
    <?php
		$tong=0;					
    if($dem > 0){
        $i = 0;
        while ($bien = mysqli_fetch_array($query))
        {
            $i++;
            $thanhtien=$bien['DonGia']*$bien['SoLuong'];
            $tong+=$thanhtien;
    ?>
    <tr>
        <td><?php  echo $i ?></td>
        <td><?php  echo $bien['IDHDB'] ?></td>
        <td align="left" style="margin-left: 10px"><?php echo $bien['TenSP'] ?></td>
        <td><?php echo $bien['SoLuong'] ?></td>
        <td align="right"><?php echo number_format($bien['DonGia'],0,",",".") ?></td>
        <td align="right"><?php echo number_format($thanhtien,0,",",".") ?></td> 
    </tr>
    <?php }	?>
		<tr>
			<td colspan=6 align="right" style="padding:5px 5px 5px 0px; font-size:20px;">Tổng tiền (chưa bao gồm thuế VAT): <font color="red"><?php echo number_format($tong,0,",",".") ?></font></td>
		</tr>
	<?php 
	}
    else echo "<tr><td colspan='6'>Không có sản phẩm trong CSDL</td></tr>";	
?>
</table>
<div id="inhoadon">
	<p style="float:right; margin-top:10px; padding-right:30px;"><a href="in_donhang.php?madh=<?=$_GET['madh']?>" target="_blank">In hoá đơn</a></p>
</div>