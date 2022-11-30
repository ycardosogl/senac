<?php

include("conexao.php");

$numero_apto= $_POST['numero_apto'];
$area_apto = $_POST['area_apto'];
$codigo_edificio = $_POST['codigo_edificio'];
$codigo_morador = $_POST['codigo_morador'];
$valor = $_POST['valor'];


if($numero_apto == "" || $numero_apto == null)
{
    echo "Número do apto não pode estar vazio!";
}
else
{
  $query = "SELECT codigo_edificio FROM edificio WHERE codigo_edificio = $codigo_edificio";
  $busca_edificio = mysqli_num_rows(mysqli_query($conn,$query));

  echo $busca_edificio; 

  if($busca_edificio != 1) {
    echo"<script language='javascript' type='text/javascript'>
    alert('Edificio no existente!');window.location.
    href='index.html'</script>";
  }
    

  $query = "SELECT codigo_morador FROM morador WHERE codigo_morador = $codigo_morador";
  $busca_morador =mysqli_num_rows(mysqli_query($conn,$query));

  echo $busca_morador;


  if($busca_morador != 1){
    echo"<script language='javascript' type='text/javascript'>
    alert('Morador não existente!');window.location.
    href='index.html'</script>";
  }

    $query = "INSERT INTO apartamento(`numero_apto`, `area_apto`, `codigo_edificio`, `codigo_morador`, `VALOR`) VALUES ('$numero_apto','$area_apto','$codigo_edificio', '$codigo_morador', '$valor')";
    echo $query;

    $insert = mysqli_query($conn, $query);

    if($insert){    
        echo"<script language='javascript' type='text/javascript'>
        alert('Apartamento cadastrado com sucesso!');window.location.
        href='index.html'</script>";
      }else{
        echo"<script language='javascript' type='text/javascript'>
        alert('Não foi possível cadastrar esse apartamento ');window.location
        .href='cadastroApto.html'</script>";
      }

       

}
?>