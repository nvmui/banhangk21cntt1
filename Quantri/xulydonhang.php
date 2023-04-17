<?php
if($_GET['admin'] == "xulyhd"){
    $mahd = $_GET['madh'];
    $state = $_POST['trangt'];
    echo "Trạng thái".$state;
    echo "Mã hoá đơn".$mahd;
}
    // include '../connet.php';
    // if($_GET['admin'] == "xulyhd"){
    //     $mahd = $_GET['madh'];
    //     $state=$_POST['trangt'];    
    //     //echo $state;
    //     $sql_check = "SELECT * FROM hoadonban WHERE IDHDB='$mahd'";
    //     $result_check = mysqli_query($con, $sql_check);
    //     $value = mysqli_fetch_array($result_check);
    //     if($value['trangthai'] == 6){
    //         echo "
    //         <script language='javascript'>
    //             alert('Đơn hàng đã được thanh toán nên không thể huỷ.');
    //             header('location: index.php?admin=donhang');
    //         </script>";
    //     }else{
    //         $sql="update hoadonban set trangthai = '$state' where IDHDB='$mahd'";
    //         header('location: index.php?admin=donhang');
    //     }
    // }    


    // if ($value['trangthai'] == 0){
    //     $sql="update hoadonban set trangthai = 1 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }else if($value['trangthai'] == 1){
    //     $sql="update hoadonban set trangthai = 2 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }else if($value['trangthai'] == 2){
    //     $sql="update hoadonban set trangthai = 3 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }else if($value['trangthai'] == 3){
    //     $sql="update hoadonban set trangthai = 4 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }else if($value['trangthai'] == 4){
    //     $sql="update hoadonban set trangthai = 5 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }else if($value['trangthai']==6){
    //     echo "
    //     <script language='javascript'>
    //         alert('Đơn hàng đã được thanh toán nên không thể huỷ.');
    //     </script>";  
    //     header('location: index.php?admin=donhang');
    // }else{
    //     $sql="update hoadonban set trangthai = 6 where IDHDB='$mahd'";
    //     mysqli_query($con,$sql);
    //     header('location: index.php?admin=donhang');
    // }		
?>