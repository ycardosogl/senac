<?php

include("conexao.php");

$nome = $_POST['nome'];
$cep = $_POST['cep'];
$numero = $_POST['numero'];
$complemento = $_POST['complemento'];
$datavistoria = $_POST['datavistoria'];
$dataconstrucao = $_POST['dataconstrucao'];

if($nome == "" || $nome == null)
{
    echo "Nome não pode estar vazio!";
} 

$query = "SELECT codigo_morador FROM morador WHERE codigo_morador = $codigo_morador";
$busca_morador = mysqli_query($query); 

if($busca_morador != 1){echo"<script language='javascript' type='text/javascript'>
  alert('Morador não existente!');window.location.
  href='index.html'</script>";
}
else
{
    $query = "INSERT INTO `edificio`(`cep`, `numero`, `complemento`, `data_construcao`, `data_vistoria`, `nome`) VALUES ('$cep','$numero','$complemento','$datavistoria','$dataconstrucao','$nome')";
    $insert = mysqli_query($conn, $query);
    if($insert){
        echo"<script language='javascript' type='text/javascript'>
        alert('Edificio cadastrado com sucesso!');window.location.
        href='index.html'</script>";
      }else{
        echo"<script language='javascript' type='text/javascript'>
        alert('Não foi possível cadastrar esse edificio');window.location
        .href='cadastroedificio.html'</script>";
      }
}

?>