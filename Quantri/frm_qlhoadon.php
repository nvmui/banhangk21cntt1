<link rel="stylesheet" href="./css/hienthi_sp.css">
<!-- <link rel="stylesheet" href="./css/index.css"> -->
<script type="text/javascript" src="js/checkbox.js"></script>
<?php
	//include './connet.php';	
    $select = "SELECT * FROM hoadonban dh INNER JOIN khachhang nd ON dh.IDKhachHang = nd.IDKhachHang";
    $query = mysqli_query($con,$select);
    $dem = mysqli_num_rows($query);
?>
<div class="quanlysp">
	<h3>QUẢN LÝ ĐƠN HÀNG</h3>
	<p>Có tổng <font color=red><b><?php echo $dem ?></b></font> đơn hàng</p><br>
</div>
<table>
    <tr class='tieude_hienthi_sp'>
        <td>STT</td>
        <td>Mã ĐH</td>
        <td>Tên khách hàng</td>
        <td>Điện Thoại</td>
        <td>Email</td>
		<td>Trạng thái</td>
		<td>Xác nhận</td>
        <td>Chi tiết</td>
    </tr>
    <?php
	/*------------Phan trang------------- */
	// Nếu đã có sẵn số thứ tự của trang thì giữ nguyên (ở đây tôi dùng biến $page) 
	// nếu chưa có, đặt mặc định là 1!   
	if(!isset($_GET['page'])){  
	$page = 1;  
	} else {  
	$page = $_GET['page'];  
	}  
	// Chọn số kết quả trả về trong mỗi trang mặc định là 10 
	$max_results = 10;  
	// Tính số thứ tự giá trị trả về của đầu trang hiện tại 
	$from = (($page * $max_results) - $max_results);  
	// Chạy 1 MySQL query để hiện thị kết quả trên trang hiện tại  
	$sql = mysqli_query($con,"SELECT * FROM hoadonban dh INNER JOIN khachhang nd ON dh.IDKhachHang = nd.IDKhachHang ORDER by IDHDB DESC  LIMIT $from, $max_results");		
	if($dem > 0){
		$i = 1;
        while ($bien = mysqli_fetch_array($sql))
        {
	?>
    <tr class='noidung_hienthi_sp'>
        <td ><?php  echo $i ?></td>
        <td align="left"><?php echo $bien['IDHDB'] ?></td>
        <td align="left"><?php echo $bien['TenKH'] ?></td>
        <td >0<?php echo $bien['SDT'] ?></td>
        <td ><?php echo $bien['email'] ?></td>
		<td>
			<?php
				if ($bien['trangthai'] == 0) {
					$trangthai = "Chờ xác nhận";
				} else if ($bien['trangthai'] == 1) {
					$trangthai = "Đã xác nhận";
				} else if ($bien['trangthai'] == 2) {
					$trangthai = "Chờ lấy hàng";
				} else if ($bien['trangthai'] == 3) {
					$trangthai = "Đang giao hàng";
				} else if ($bien['trangthai'] == 4) {
					$trangthai = "Đã giao hàng";
				} else if ($bien['trangthai'] == 5) {
					$trangthai = "Đã Thanh toán";
				} else {
					$trangthai = "Đã hủy";
				}
				echo $trangthai;
			?>
		</td>
		<form method="post">
			<td style="width:70px;">
			<select name="trangt">
				<option value="0">Chờ xác nhận</option>
				<option value="1">Huỷ đơn hàng</option>
				<option value="2">Đã xác nhận</option>
				<option value="3">Chờ lấy hàng</option>
				<option value="4">Đang giao hàng</option>
				<option value="5">Đã giao hàng</option>
				<option value="6">Đã Thanh toán</option>
			</select>
			<a href="index.php?admin=xulyhd&madh=<?php echo $bien['IDHDB']; ?>" style="float:left;">Xác nhận</a>
		</form>
        <td style="width:70px;"><a href="index.php?admin=chitiethoadon&madh=<?php echo $bien['IDHDB']; ?> " style="float:left;">Chi tiết</a>	
        </td>
    </tr>
	<?php 
		$i++;}		
	}else echo "<tr><td colspan='6'>Không có sản phẩm trong CSDL</td></tr>";
?>
</table>
<div id="phantrang_sp">
<?php
	// Tính tổng kết quả trong toàn DB:  
	$total_results = mysqli_num_rows(mysqli_query($con,"SELECT COUNT(*) as Num FROM hoadonban"));  
	// Tính tổng số trang. Làm tròn lên sử dụng ceil()  
	$total_pages = ceil($total_results / $max_results);  
	// Tạo liên kết đến trang trước trang đang xem 
	if($page > 1){  
	$prev = ($page - 1);  
	echo "<a href=\"".$_SERVER['PHP_SELF']."?admin=hienthihd&page=$prev\"><button class='trang'>Trang trước</button></a>&nbsp;";  
	}  
	for($i = 1; $i <= $total_pages; $i++){  
	if(($page) == $i){  
	echo "$i&nbsp;";  
	} else {  
	echo "<a href=\"".$_SERVER['PHP_SELF']."?admin=hienthihd&page=$i\"><button class='so'>$i</button></a>&nbsp;";  
	}  
	}  
	// Tạo liên kết đến trang tiếp theo  
	if($page < $total_pages){  
	$next = ($page + 1);  
	echo "<a href=\"".$_SERVER['PHP_SELF']."?admin=hienthihd&page=$next\"><button class='trang'>Trang sau</button></a>";  
	}  
	echo "</center>";  		
?>
</div>