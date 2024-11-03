<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <table>
        <thead>
            <tr>
                <td>Valor de $var</td>
                <td>Parseo a Int</td>
                <td>Parseo a Boolean</td>
                <td>Parseo a String</td>
                <td>Parseo a Float</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>NULL</td>
                <td>
                    <?php
                    $var = NULL;
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = NULL;
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = NULL;
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = NULL;
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>true</td>
                <td>
                    <?php
                    $var = true;
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = true;
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = true;
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = true;
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>false</td>
                <td>
                    <?php
                    $var = false;
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = false;
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = false;
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = false;
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>0</td>
                <td>
                    <?php
                    $var = 0;
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = 0;
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = 0;
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = 0;
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>3.8</td>
                <td>
                    <?php
                    $var = 3.8;
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = 3.8;
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = 3.8;
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = 3.8;
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>'0'</td>
                <td>
                    <?php
                    $var = '0';
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = '0';
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = '0';
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = '0';
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>'10'</td>
                <td><?php
                    $var = '10';
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = '10';
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = '10';
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = '10';
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>'6 metros'</td>
                <td>
                    <?php
                    $var = '6 metros';
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = '6 metros';
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = '6 metros';
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = '6 metros';
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
            <tr>
                <td>'hola'</td>
                <td>
                    <?php
                    $var = 'hola';
                    print ('<span class="clase">(int)$var</span> == ' . (int)$var) . "<br/>";
                    print ('<span class="clase">intval($var)</span> == ' . intval($var)) . "<br/>";
                    ?>
                </td>
                <td>
                    <?php
                    $var = 'hola';
                    print('<span class="clase">boolval($var)</span> == ' . boolval($var) . '<br/>');
                    print ('<span class="clase">(Boolean)$var ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false')) . '<br>';
                    print('<span class="clase">boolval($var) ? ' . "'true'" . ' : ' . "'false'" . ';</span> == ' . ((bool)$var ? 'true' : 'false'));
                    ?>
                </td>
                <td>
                    <?php
                    $var = 'hola';
                    print('<span class="clase">(string)$var</span> == ' . (string)$var . '<br/>');
                    print('<span class="clase">strval($var)</span> == ' . strval($var) . '<br/>');
                    ?>
                </td>
                <td>
                    <?php
                    $var = 'hola';
                    print('<span class="clase">(float)$var</span> == ' . (float)$var . '<br/>');
                    print('<span class="clase">floatval($var)</span> == ' . floatval($var) . '<br/>');
                    ?>
                </td>
            </tr>
        </tbody>
    </table>
</body>

</html>