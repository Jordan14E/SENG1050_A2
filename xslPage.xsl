<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="carsForSale">

        <html>
            <head>
                <meta charset="UTF-8"/>
                <link  rel= "stylesheet" type ="text/css" href="/style.css"/>		<!--Link to css document for styling-->
                <style>
                    html{
                </style>
                <title><xsl:text>Jim's cars- </xsl:text><xsl:value-of select="car/@vehicleType"/></title>		<!--Document title-->
            </head>
            <body>
                <div id="head">			<!--Holds page heading, logo and navigation bar-->
                    <img src="../Images/logo.png" alt ="logo" id="logo"/>		<!--"Jim's group logo image-->
                    <xsl:if test="car/@vehicleType = 'fourWheelDrive'">
                        <h1 style= "text-align: center">Four Wheel Drives</h1>
                    </xsl:if>
                    <xsl:if test="car/@vehicleType = 'sportCar'">
                        <h1 style= "text-align: center">Sports Cars</h1>
                    </xsl:if>
                    <hr/>

                    <a class="link" href="../index.html">Home</a>
                    -
                    <xsl:if test="car/@vehicleType = 'fourWheelDrive'">
                        <a class="link"  href="sportsCar.xml">Sports Cars</a>
                    </xsl:if>
                    <xsl:if test="car/@vehicleType = 'sportCar'">
                        <a class="link"  href="fourWheelDrive.xml">Four Wheel Drives</a>
                    </xsl:if>

                    <!--TODO: Add data collection page here-->

                    <hr/>
                    <br/>
                    <br/>
                </div>

                <xsl:apply-templates select="car">
                        <xsl:sort select="carModel"/>
                </xsl:apply-templates>

                <!-- TODO: add contact here--><!--maybe?-->

            </body>
            <address>

            </address>
        </html>
    </xsl:template>

    <xsl:template match="car">
        <h2><xsl:value-of select="make"/> <xsl:value-of select="carModel"/>, <xsl:value-of select="year"/></h2>
        <br/>
        <img alt="Picture not found" class="carPic">
            <xsl:attribute name="src">
                    <xsl:value-of select="picture"/>
            </xsl:attribute>
        </img>
        <br/>
        <p><xsl:value-of select="description"/><br/>

            <xsl:text>Detailed information on this car can be found on the manufacturer's website: </xsl:text><xsl:value-of select="URL"/>

        </p>
        <br style="line-height:10cm"/>
    </xsl:template>
</xsl:stylesheet>