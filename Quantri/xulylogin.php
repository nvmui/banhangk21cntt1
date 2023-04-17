<?php
    
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
    							window.open('quantri/index.php','_self', 1);
    						</script>";
                    }
                    else
                    {                        
    					echo "<script language='javascript'>    							
    							window.open('index.php','_parent', 0);
    						</script>";                                         
                    }
                }
            }
        }
    }
?>