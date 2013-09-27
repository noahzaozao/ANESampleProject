adt='/Applications/Adobe Flash Builder 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/adt'
nativedir=/Users/stevewarren/Clients/Speakaboos/git_repositories/ANESampleProject/ANESample_java

echo "********************************************************************"
echo " - creating ANE package"

rm -rf Android-ARM/*
rm -f SampleASExtension.ane library.swf
mkdir -p Android-ARM

unzip ../ANESample/bin/ANESample.swc library.swf
cp library.swf Android-ARM
cp library.swf ../ANESample/bin
cp $nativedir/ANESample.jar Android-ARM
cp -r $nativedir/res Android-ARM

#Example from http://esdot.ca/site/2012/tutorial-packaging-anes
#"%ADT%" -package -target ane "%OUTPUT%" "%XML%" -swc "%SWC%" %ANDROID_PLATFORM% %DEFAULT_PLATFORM%

"$adt" -package -target ane com.adobe.sampleasextension.SampleASExtension.ane extension.xml -swc ../ANESample/bin/ANESample.swc -platform Android-ARM -C Android-ARM . -platform default -C ../ANESample/bin .

#TO PACKAGE WITH CODE SIGNING
#"$adt" -package -storetype PKCS12 -keystore cer.p12 -storepass password -target ane SampleASExtension.ane extension.xml -swc ../ANESample/bin/ANESample.swc -platform Android-ARM -C Android-ARM .