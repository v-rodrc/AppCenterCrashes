if [ -z "$VERSION_NAME" ]

			then

			echo "You need define the VERSION_NAME variable in App Center"

			exit

			fi

			ANDROID_MANIFEST_FILE=$APPCENTER_SOURCE_DIRECTORY/Droid/Properties/AndroidManifest.xml

			if [ -e "$ANDROID_MANIFEST_FILE" ]

			then

			echo "Updating version name to $VERSION_NAME in AndroidManifest.xml"

			sed -i '' 's/versionName="[0-9.]*"/versionName="'$VERSION_NAME'"/' $ANDROID_MANIFEST_FILE

			echo "File content:"

			cat $ANDROID_MANIFEST_FILE


			fi











			if [ -e "$INFO_PLIST_FILE" ]



			then



			echo "Updating version name to $VERSION_NAME in Info.plist"



			plutil -replace CFBundleShortVersionString -string $VERSION_NAME $INFO_PLIST_FILE







			echo "File content:"



			cat $INFO_PLIST_FILE



			fi