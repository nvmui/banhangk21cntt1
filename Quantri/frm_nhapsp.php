<?php 
include('../connet.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./admin_stype.css">
    <title>Nhập sản phẩm</title>
</head>
<body>
    <form method="post" enctype="multipart/form-data">
        <h3 style="text-align: center;">NHẬP DANH MỤC SẢN PHẨM</h3>
        <table align="center" border="0">
            <tr>
                <td></td>
                <td>Nhập mã sản phẩm</td>
                <td><input  type="text" name="txt_masp" placeholder="Nhập mã sản phẩm"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Nhập tên sản phẩm</td>
                <td><input  type="text" name="txt_tensp" placeholder="Nhập tên sản phẩm"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Chọn hãng sản xuất</td>
                <td><select name="hangsx">
                <option>==Chọn hãng sản xuất==</option>
                    <?php            				
                        $sql = "select * from hangsanxuat";
                        $loai = mysqli_query($con, $sql);
                        while($row = mysqli_fetch_array($loai)){					
                            echo "<option value=".$row['IDHang'].">".$row['TenHang']."</option>";
                        }
                    ?>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Chọn loại sản phẩm</td>
                <td><select name="loaisp">
                    <option>==Chọn loại sản phẩm==</option>
                    <?php            				
                        $sql = "select * from loaisp";
                        $loai = mysqli_query($con, $sql);
                        while($row = mysqli_fetch_array($loai)){					
                            echo "<option value=".$row['IDLoaiSP'].">".$row['TenLoai']."</option>";
                        }
                    ?>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Chọn nhà cung cấp</td>
                <td><select name="nhacc">
                    <option>==Chọn nhà cung cấp==</option>
                    <?php            				
                        $sql = "select * from nhacungcap";
                        $nhacc = mysqli_query($con, $sql);
                        while($row = mysqli_fetch_array($nhacc)){					
                            echo "<option value=".$row['IDNhaCungCap'].">".$row['TenNhaCC']."</option>";
                        }
                    ?>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Chọn file hình</td>
                <td><input type="file" name="anhdaidien"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Mô tả sản phẩm</td>
                <td><textarea name="mota" placeholder="Nhập mô tả sản phẩm" name="" id="" rows="5" style="width: 300px;"></textarea></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <input class="btn" type="submit" value="Cập nhật" name="btn_capnhat">
                </td>
            </tr>
            <?php include('./xulynhap_sp.php'); ?>
        </table>
    </form>
</body>
</html>