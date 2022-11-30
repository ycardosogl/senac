<?php

include("conexao.php");

$cpf= $_POST['cpf'];
$nome = $_POST['nome'];
$sexo = $_POST['sexo'];
$data_de_nascimento = $_POST['data_de_nascimento'];
$cep = $_POST['cep'];


if($nome == "" || $nome == null)
{
    echo "Nome não pode estar vazio!";
}
else
{
    $query = "INSERT INTO morador(`cpf`, `nome`, `sexo`, `data_de_nascimento`, `cep`) VALUES ('$cpf','$nome','$sexo', '$data_de_nascimento', '$cep')";
    echo $query;
    $insert = mysqli_query($conn, $query);
    if($insert){
        echo"<script language='javascript' type='text/javascript'>
        alert('Morador cadastrado com sucesso!');window.location.
        href='index.html'</script>";
      }else{
        echo"<script language='javascript' type='text/javascript'>
        alert('Não foi possível cadastrar esse morador');window.location
        .href='cadastroMorador.html'</script>";
      }
}

?>