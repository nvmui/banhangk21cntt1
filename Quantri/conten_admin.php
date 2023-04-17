<?php
include '../connet.php';
if(isset($_GET['admin']))
	switch($_GET['admin'])
	{
		case 'sanpham':{
			include ("frm_nhapsp.php");
			break;
		}
		case 'donhang':{
			include ("frm_qlhoadon.php");
			break;		
		}
		case 'chitiethoadon':{
			include ("ql_ctdonhang.php");
			break;		
		}
		case 'xulyhd':{
			include('./xulydonhang.php');
			break;
		}
		default:
			// include ("sanpham.php");
		break;
	}
	else{
	// include('tonghop.php');
	}
?>