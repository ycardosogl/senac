<?php
include("conexao.php");

function listaEdificio() {
include("conexao.php");
$query = "select * from edificio"; 
$result_query = mysqli_query( $conn, $query );

echo "<table>";
# Exibe os registros na tela 
while ($row = mysqli_fetch_array( $result_query ))
{ 
      echo "<tr>";
      echo "<br>";
      print "<td>"  .$row[1] ."</td>" ."<td>" . $row[2] . "</td>" . "<td>" . $row[3] . "</td>"  . "<td>" . $row[4] .  "</td>" . "<td>"  .$row[5] . "</td>" ."<td>" .$row[6] ."</td>";
      echo "</tr>";
}

echo "</table>";


mysqli_close($conn);
}
function cadastroEdificio ($cep,$numero,$complemento,$datavistoria,$dataconstrucao,$nome) {

      $query = "INSERT INTO `edificio`(`cep`, `numero`, `complemento`, `data_construcao`, `data_vistoria`, `Nome`) VALUES ('$cep','$numero','$complemento','$datavistoria','$dataconstrucao','$nome')";
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