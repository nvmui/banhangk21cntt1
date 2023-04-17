<meta charset="utf-8" />
<h2 style="text-align: center;">CHI TIẾT GIỎ HÀNG</h2>  
<div class="table-responsive"> 
    <table class="table table-bordered" border="1px" style="border-collapse:collapse; border-color: green">  
        <tr style="font-weight:bold; background-color: green"> 
            <th width="2%">STT</th>
            <th width="25%">Tên sản phẩm</th>  
            <th width="5%">Số lượng</th>  
            <th width="12%">Giá</th>  
            <th width="12%">Tổng tiền</th>  
            <th width="18%">Action</th>
        </tr>  
        <?php
        // include('./connet.php');
        $total = 0; $tongsp = 0;
        if(isset($_SESSION["cart"]) && $_SESSION["cart"] != null){
            $count = count($_SESSION["cart"]);
            $sql="SELECT * FROM sanpham sp INNER JOIN dongia dg on sp.IDSanPham=dg.IDSanPham WHERE dg.Chon=1 and sp.IDSanPham IN ("; 
            foreach($_SESSION['cart'] as $id => $value) { 
                $sql.=$id.","; 
            } 
            $sql = substr($sql, 0, -1).") ORDER BY sp.IDSanPham ASC"; 
            // echo $sql;
            $query = mysqli_query($con, $sql);
            if(mysqli_num_rows($query)>0){             
            while($row = mysqli_fetch_array($query)){
                //for($i=1; $i<=$count; $i++){
        ?> 
        <!-- <form method="post"> -->
        <tr>
            <td>
                <?php 
                    echo $row[0] ;
                ?>
            </td>
            <td style="padding-left: 10px">
                <a href="index.php?action=chitiet&id=<?php echo $row['IDSanPham'] ?>">
                <?php echo $row["TenSP"];?></a>
            </td>  
            <td style="text-align:center">
                
                <input type="number" name="sl" <?php echo $row['IDSanPham'] ?>
                value="<?php echo $_SESSION['cart'][$row['IDSanPham']]['sl'] ?>"
                style="width: 40px; border-style: none;text-align: center;" >        
            </td>  
            <td style="text-align:right; padding-right:5px;">
                <?php echo number_format($row["GiaBan"],0); ?>
            </td>  
            <td style="text-align:right; padding-right:5px;">
                <?php echo number_format($_SESSION['cart'][$row['IDSanPham']]['sl'] * $row["GiaBan"]);?>
            </td>
            <td style="text-align:center">
                <a href="index.php?giohang=delete&idsp=<?php echo $row["IDSanPham"]; ?>"><button style="width:60px;">Xoá</button></a>
                <input type="hidden" name="sl" value="">
                <a href="index.php?giohang=update&idsp=<?php echo $row["IDSanPham"]; ?>"><button style="width:60px;">Cập nhật</button></a>
            </td> 
        </tr>
        <!-- </form> -->
        <?php  					
            $total = $total + ($_SESSION['cart'][$row['IDSanPham']]['sl'] * $row["GiaBan"]);
            $tongsp = $tongsp + $_SESSION['cart'][$row['IDSanPham']]['sl'];
            }
        ?>  
        <tr>
            <td align="center" colspan="2" style="font-weight:bold; padding-right:5px; border-color: green">Tổng cộng</td>
            <td align="right" style="font-weight:bold; padding-right:5px"><?php echo number_format($tongsp); ?></td> 
            <td></td>
            <td align="right" style="font-weight:bold; padding-right:5px"><?php echo number_format($total); ?></td>  
            <td></td>  
        </tr>
        <tr>
            <td colspan="5" style="text-align:center">
                <a href="index.php"><button style="width:150px; margin-top:5px; margin-bottom:5px; color:red ">Mua hàng tiếp</button></a>
                <a href="./index.php?loaisp=thanhtoan"><button style="width:150px; margin-top:5px; margin-bottom:5px">Thanh toán</button></a>
            </td>
        </tr>
        <?php
       // }
            }
            else{
                echo "Giỏ hàng không có sản phẩm nào!";
            }
    }
    ?>  
    </table>
</div> 