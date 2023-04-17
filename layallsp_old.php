<?php
include('connet.php');
$sql = "SELECT * FROM sanpham";
$kq = mysqli_query($con, $sql);
if(mysqli_num_rows($kq)>0){
    while($row=mysqli_fetch_array($kq)){
        ?>
            <div class="col-lg-4 col-md-6 col-sm-12 mt-3">
                <div class="card">
                    <img class="card-img-top" width="150px" src="./upload/<?php echo $row['HinhDaiDien'];?>" alt="">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $row['TenSP'];?></h5>
                        <h6 class="card-subtitle mb-1 text-muted">Ví dụ mẫu sử dụng Card</h6>
                        <p class="card-text">Nội dung văn bản trong <code>.card-body</code> này sử dụng <code>.card-text</code>.</p>
                        <a href="#" class="btn btn-primary">Nút bấm</a>
                    </div>                       
                </div>
            </div>
        <?php
    }
}
?>