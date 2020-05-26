if [ -z "$VERSION_CODE" ]
then
	echo "To use this script, define VERSION_CODE in App Center build settings portal under environment variables"
	exit
fi

ANDROID_BUILD_GRADLE=$APPCENTER_SOURCE_DIRECTORY/build.gradle

echo "$APPCENTER_SOURCE_DIRECTORY"

if [ -e "$ANDROID_BUILD_GRADLE" ]
then
	echo "version code:" $VERSION_CODE
	cat $ANDROID_BUILD_GRADLE
	echo "Updating version name to $VERSION_NAME in AndroidManifest.xml"

	# sed command is stream editor,
	#  i\ subcommands can continue onto more than one line, provided all lines but the last end with a
	#  \ (backslash) to quote the new-line character.
	sed -i '' 's/versionCode "[0-9.]*"/versionCode "'$VERSION_CODE'"/' $ANDROID_BUILD_GRADLE
	echo "File content:"
	cat $ANDROID_BUILD_GRADLE

fi




			#if [ -e "$INFO_PLIST_FILE" ]



#			then
#
#
#
#			echo "Updating version name to $VERSION_NAME in Info.plist"
#
#
#
#			plutil -replace CFBundleShortVersionString -string $VERSION_NAME $INFO_PLIST_FILE
#
#
#
#
#
#
#
#			echo "File content:"
#
#
#
#			cat $INFO_PLIST_FILE
#
#
#
#			fi