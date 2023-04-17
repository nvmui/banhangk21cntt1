<?php
use Vtiful\Kernel\Format;
include('connet.php');
$sql = ('SELECT * FROM sanpham sp INNER JOIN dongia dg on sp.IDSanPham=dg.IDSanPham WHERE dg.Chon=1');
$kq = mysqli_query($con, $sql);
if(mysqli_num_rows($kq)>0){
    while($row=mysqli_fetch_array($kq)){           
        ?>
        <div class="col-lg-4 col-md-6 col-sm-12 mt-2">
            <div class="card">
                <img class="card-img-top mt-2" width="150px" src="./upload/<?php echo $row['HinhDaiDien']; ?>" alt="">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $row['TenSP']; ?></h5>
                    <h5 class="card-title" style="color: red; font-weight: bold;"><?php echo number_format($row['GiaBan'])."đ"; ?></h5>                    
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
?>