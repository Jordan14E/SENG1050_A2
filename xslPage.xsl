<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="carsForSale">

        <htmll>
            <head>
                <meta charset="UTF-8"/>
                <link rel= "stylesheet" type = "text/css" href="style.css"/>		<!--Link to css document for styling-->
                <title>Jim's cars- </title>			<!--Document title-->
            </head>
            <body>
            <div id="head">			<!--Holds page heading, logo and navigation bar-->
                <img src="Images/logo.png" alt ="logo" id="logo"/>		<!--"Jim's group logo image-->
                <h1 style= "text-align: center">Jim's Cars</h1>		<!--Main heading for page-->
                <hr/>
                <a class="link" id="link1" href="XML/fourWheelDrive.xml">Four Wheel Drives</a>		<!--Link to XML document-->
                -
                <a class="link" id="link2" href="XML/sportsCar.xml">Sports Cars</a>			<!--Link to XML document-->
                <hr/>
                <br/>
                <br/>
            </div>
            </body>
        </htmll>



    </xsl:template>


</xsl:stylesheet>