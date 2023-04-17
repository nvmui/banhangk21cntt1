<?php
    include ("./connet.php");
    // echo "Chào bạn";
    if(isset($_GET["giohang"])){
        if($_GET["giohang"] == "add"){
            $idsp = $_GET["idsp"];
            $sl1=$_POST['sldat'];
            $giaban = $_POST['hidden_price'];
            if(isset($_SESSION['cart'][$idsp])){   
                if($sl1<=0){
                    echo '<script> alert("Số lượng mua phải lớn hơn 0!")</script>';
                }else{
                    $_SESSION['cart'][$idsp]['sl']=$_SESSION['cart'][$idsp]['sl']+$sl1;
                    header('location: index.php');
                }
            }else{ 
                //$sql_s="SELECT * FROM sanpham sp INNER JOIN dongia dg on sp.IDSanPham=dg.IDSanPham WHERE dg.Chon=1 and sp.IDSanPham={$idsp}";
                //$query_s=mysqli_query($con, $sql_s); 
                //if(mysqli_num_rows($query_s)!=0){ 
                   // $row_s=mysqli_fetch_array($query_s);
                   if($sl1<=0){
                        echo '<script> alert("Số lượng mua phải lớn hơn 0!")</script>';
                   }else{
                        $_SESSION['cart'][$idsp]=$idsp;
                        $_SESSION['cart'][$idsp]=array(
                        "sl" => $sl1, 
                        "price" => $giaban);
                            // $_SESSION['cart'][$row_s['IDSanPham']] = array( 
                            //     "sl" => $sl1, 
                            //     "price" => $row_s['GiaBan'] 
                            // );
                        header('location: index.php');
                    }
                // }else{                  
                //     $message="Mã sản phẩm này không có trong hệ thống!";
                // }    
            }        
        }
        if($_GET["giohang"] == "delete"){
            $id = $_GET["idsp"];
            unset($_SESSION['cart'][$id]);
            echo '<script>window.location.href="index.php?loaisp=view_cart"</script>'; 
        }
        if($_GET["giohang"] == "update"){
            $sl = $_POST['sl'];
            $id = $_GET["idsp"];
            echo '<script> alert("Update mã sản phẩm '.$id.' Số lương '.$sl.' !")</script>';
            //$_SESSION['cart'][$idsp]['sl']=$_SESSION['cart'][$idsp]['sl']+$sl;
            // echo '<script> alert("Update mã sản phẩm '.$id.' Số lương '.$sl.' !")</script>';
            echo '<script>window.location.href="index.php?loaisp=view_cart"</script>'; 
        }
    }
?>