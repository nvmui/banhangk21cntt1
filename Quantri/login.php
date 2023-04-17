<?php
    session_start();
    if(isset($_SESSION['username']))
    {
    if($_SESSION['phanquyen']==1)
    {
    	header("location:../index.php");
    }
    if($_SESSION['phanquyen']==0)
    {
    	header("location:login.php");
    }
    }
?> 
<div style="border: 1px solid #111; width: 400px; height: 180px; margin:auto; text-align: center;">
    <div>
        <h2>Đăng nhập quản trị hệ thống</h2>
    </div>
    <div align="center">
        <form action="" method="post">
            <table>
                <tr>
                    <td>Tên tài khoản</td>
                    <td><input type="text" name="user" placeholder=" Username" style="height: 25px; width: 200px"></td>
                </tr>
                <tr>
                    <td>Mật khẩu</td>
                    <td><input type="password" name="pass" placeholder=" Password" style="height: 25px; width: 200px; margin-top: 10px"></td>
                </tr>
                <tr >
                    <td colspan="2" style="margin-top: 10px; text-align: center;">
                        <button name="login" class="dangnhap" style="margin-top: 10px">Đăng nhập</button>
                        <button class="thoat"><a href="../index.php">Thoát</a></button>
                    </td>
                </tr>
            </table>                
        </form>
    </div>
</div>
<?php
    include '../connet.php';
    // include 'xulylogin.php';
    // include ("../connetion/connet.php");
    if(isset($_POST['login']))
    {
        $username = $_POST['user'];
        $password = MD5($_POST['pass']);
        $sql_check = mysqli_query($con,"select * from khachhang where username = '$username'");
        $dem = mysqli_num_rows($sql_check);
        if($dem == 0)
        {
            echo "<p style='text-align:center'>Tài khoản không tồn tại</p>";
        }
        else
        {
            $sql_check2 = "select * from khachhang where username = '$username' and passwword = '$password'";
    		$row = mysqli_query($con, $sql_check2);	
            $dem2 = mysqli_num_rows($row);
            if($dem2 == 0)
                echo "<p style='text-align:center'>Mật khẩu không chính xác</p>";
            else{
                while($rows = mysqli_fetch_array($row))
                {
                    $_SESSION['username'] = $username;
    				$_SESSION['phanquyen'] = $rows['phanquyen'];
    				$_SESSION['idnd'] = $rows['IDKhachHang'];
                    if($rows['phanquyen'] == 0)
                    {                        
    					echo "<script language='javascript'>
    							alert('Đăng nhập quản trị thành công');
    							window.open('index.php','_self', 1);
    						</script>";
                    }
                    else
                    {                        
    					header('location:../index.php');
                    }
                }
            }
        }
    }
?>
