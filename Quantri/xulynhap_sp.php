<?php 
    if(isset($_POST['btn_capnhat'])){
        if($_POST['txt_tensp']!=null){
            $masp=$_POST['txt_masp'];
            $tensp=$_POST['txt_tensp'];
            $hangsx = $_POST['hangsx'];
            $loaisp = $_POST['loaisp'];
            $nhacc = $_POST['nhacc'];
            $anh = $_FILES['anhdaidien']['name'];
            if($anh!=''){
                $dich = "../upload/".$anh;
                move_uploaded_file($_FILES['anhdaidien']['tmp_name'],$dich);
                $dich = substr($dich,3);
            }
            //echo $dich;
            $mota=$_POST['mota'];
            $sql="INSERT INTO sanpham(IDSanPham, TenSP, IDLoaiSP, IDHang, IDNhaCungCap, MoTaSP, HinhDaiDien, TrangThai) VALUES('$masp','$tensp','$loaisp','$hangsx', '$nhacc','$mota', '$anh',1)";
            if (mysqli_query($con, $sql)===TRUE) {?>
                <script>
                   alert("Bạn đã thêm mơi thành công!");
               </script>
            <?php } else{?>
                <script>
                   alert("Thêm mới thất bại.");
               </script><?php
            }	
        }else{?>
			<script>
			   alert("Bạn phải nhập tên sản phẩm");
		   </script><?php
        }
    }
?>