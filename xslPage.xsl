<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <!--Name: xslPage.xsl
	Author: Jordan Eade
	Student Number: c3350651
	Date file created: 20/10/21
-->

    <xsl:template match="carsForSale">

        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <link  rel="stylesheet" type ="text/css" href="../style.css"/>		<!--Link to css document for styling-->
                <style>
                    #desDiv{font-size: larger;}
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
                        <a class="link" href="sportsCar.xml">Sports Cars</a>
                    </xsl:if>
                    <xsl:if test="car/@vehicleType = 'sportCar'">
                        <a class="link" href="fourWheelDrive.xml">Four Wheel Drives</a>
                    </xsl:if>
                    -
                    <a class="link" href="../data.html">Create Listing</a>
                    -
                    <a class="link" href="../privacy.html">Privacy policy</a>
                    -
                    <a class="link" href="../terms.html"><![CDATA[Terms & Conditions]]></a>
                    -
                    <a class="link" href="../contact.html">Contact Us</a>
                    -
                    <a class="link" href="../aboutUs.html">About Us</a>

                    <hr/>
                    <br/>
                </div>
                    <br/>

                <div id="list" style="float:left;">
                <xsl:apply-templates select="car">
                        <xsl:sort select="carModel"/>
                </xsl:apply-templates>
                </div>
                <address id="copyright">Copyright - Jordan Eade<br/>University of Newcastle<br/>c3350651@uon.edu.au<br/>		<!--copyright statement-->
                    <!--External website, goes to Assessment 1 brief for SENG1050-->
                    <a href="https://uonline.newcastle.edu.au/bbcswebdav/pid-5239564-dt-content-rid-30198625_1/courses/CRS.134585.2021.S2/SENG1050%20-%20Assignment%202.html#peb">Assessment Brief</a>
                </address>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="car">
        <h2><xsl:value-of select="make"/><xsl:text> </xsl:text><xsl:value-of select="carModel"/><xsl:text>, </xsl:text><xsl:value-of select="year"/></h2>
        <br/>


        <img alt="Picture not found" class="carPic">
            <xsl:attribute name="src">
                    <xsl:value-of select="picture"/>
            </xsl:attribute>
        </img>
        <br/>

        <ul>
            <li>
            <xsl:text>Price: </xsl:text><xsl:value-of select="cost"/><!--Cost of the vehicle, taken from the XML cost element-->
            </li>
            <li>
            <xsl:text>Safety rating: </xsl:text>                <!--Safety Rating, uses the choose and when functions to determine which star rating
                                                                    to display based on the child on safetyRating in the XML document -->

            <xsl:choose>
                <xsl:when test="safetyRating/star1">1 star</xsl:when>
                <xsl:when test="safetyRating/star2">2 star</xsl:when>
                <xsl:when test="safetyRating/star3">3 star</xsl:when>
                <xsl:when test="safetyRating/star4">4 star</xsl:when>
                <xsl:when test="safetyRating/star5">5 star</xsl:when>
            </xsl:choose>
            </li>

            <!--odometerReading-->
            <li>
            <xsl:text>Odometer reading: </xsl:text><xsl:value-of select="odometerReading"/>
            </li>
            <!--year-->
            <li>
            <xsl:text>Year of Production: </xsl:text><xsl:value-of select="year"/>
            </li>

            <!--fuelType-->

            <li>
            <xsl:text>Fuel type: </xsl:text><xsl:value-of select="fuelType"/>
            </li>

            <!--transmission-->

            <li>
            <xsl:text>Transmission: </xsl:text><xsl:value-of select="transmission"/>
            </li>

            <!--driveType-->

            <li>
            <xsl:text>Drive type: </xsl:text><xsl:value-of select="driveType"/>
            </li>


            <xsl:for-each select="extras">
                <li>
                    <xsl:text>Extra option: </xsl:text><xsl:value-of select="options"/><br/>
                    <xsl:text>Extra price: </xsl:text><xsl:value-of select="additionalCost"/>
                </li>
            </xsl:for-each>

            <!--state-->

            <li>
            <xsl:text>State listed: </xsl:text><xsl:value-of select="state"/>
            </li>

            <!--couponCode-->


            <xsl:if test="couponCode != ''">
                <li>
                <xsl:text>Jim's Cars coupon Code: </xsl:text><xsl:value-of select="couponCode"/>
                </li>
            </xsl:if>

            <!--reviews-->

            <xsl:for-each select="reviews">
                <li>
                <xsl:text>Review: </xsl:text><xsl:value-of select="reviews"/>
                </li>
            </xsl:for-each>

            <!--Description starts here TODO: Maybe make this section more interesting with div?-->
            <br/>
            <div id="desDiv">
            <xsl:value-of select="description"/>
            <br id="doubleBR"/>




            <xsl:text>Detailed information on this car can be found on the manufacturer's website:
            </xsl:text>
            <a class="link">
                <xsl:attribute name="href">
                    <xsl:value-of select="URL"/>
                </xsl:attribute>
            <xsl:value-of select="URL"/>
            </a>
            </div>
        </ul>
        <br style="line-height:2cm"/>

    </xsl:template>

</xsl:stylesheet>