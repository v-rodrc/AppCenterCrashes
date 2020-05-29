
if [ -z "$VERSION_NAME" ]
then
	echo "To use this script, define VERSION_CODE in App Center build settings portal under environment variables"
	exit
fi

ANDROID_BUILD_GRADLE=$APPCENTER_SOURCE_DIRECTORY/app/build.gradle



if [ -e "$ANDROID_BUILD_GRADLE" ]
then
	echo "version code:" $VERSION_NAME
	cat $ANDROID_BUILD_GRADLE
	echo "Updating version code to $VERSION_NAME in build.gradle file"

	sed 's/versionCode [0-9a-zA-Z -_]*/versionCode '$(("$VERSION_NAME"))'/' $ANDROID_BUILD_GRADLE

	echo "File content:"
	cat $ANDROID_BUILD_GRADLE

fi
#
#if [ -z "$VERSION_CODE" ]
#then
#	echo "To use this script, define VERSION_CODE in App Center build settings portal under environment variables"
#	exit
#fi
#
#ANDROID_BUILD_GRADLE=$APPCENTER_SOURCE_DIRECTORY/app/build.gradle
#
#
##echo "$APPCENTER_SOURCE_DIRECTORY"
#
#if [ -e "$ANDROID_BUILD_GRADLE" ]
#then
#	echo "version code:" $VERSION_CODE
#	cat $ANDROID_BUILD_GRADLE
#	echo "Updating version code to $VERSION_CODE in build.gradle file"
#
#	# sed command is stream editor,
#	#  -i to edit files in-place instead of printing to standard output
#	#-e
#
#
##[0-9]* matches a sequence of digits of any length
#	#sed -i '' 's/versionCode "[0-9.]*"/versionCode "'$VERSION_CODE'"/' $ANDROID_BUILD_GRADLE
#
#	sed 's/versionCode [0-9a-zA-Z -_]*/versionCode '$(($VERSION_CODE))'/' $ANDROID_BUILD_GRADLE
#
#	echo "File content:"
#	cat $ANDROID_BUILD_GRADLE
#
#fi

#app/build.gradle



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