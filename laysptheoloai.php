<?php
include("./connet.php");
if (isset($_GET['idloai'])) {
    $id = $_GET['idloai'];
    $sql = "SELECT * FROM sanpham sp INNER JOIN dongia dg on sp.IDSanPham=dg.IDSanPham WHERE dg.Chon=1 and IDLoaiSP=$id";
    $kq = mysqli_query($con, $sql);
if(mysqli_num_rows($kq)>0){
    while($row=mysqli_fetch_array($kq)){
        ?>
        <div class="col-lg-4 col-md-6 col-sm-12 mt-2">
            <div class="card">
                <img class="card-img-top mt-2" src="./upload/<?php echo $row['HinhDaiDien']; ?>" alt="">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $row['TenSP'] ?></h5>
                    <h6 class="card-subtitle mb-1 text-muted"><?php echo number_format($row['GiaBan'])." vnđ"; ?></h6>
                    <p class="card-text"><?php echo $row['MoTaSP'] ?></p>
                    <p style="color: gold;">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <i class="far fa-star"></i>
                    </p>
                    <a href="#" class="btn btn-primary">Nút bấm</a>
                </div>                       
            </div>
        </div>
        <?php       
    }
}
}else{
    echo "Đang cập nhật dữ liệu!";
}
?>