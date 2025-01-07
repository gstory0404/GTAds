# allowBackup冲突
由于穿山甲sdk与优量汇sdk 对allowBackup设置的不同导致运行合并清单文件出现冲突
```
Attribute application@allowBackup value=(false) from [:GDTSDK.unionNormal.4.610.1480:] AndroidManifest.xml:32:9-36
	is also present at [com.pangle.cn:mediation-sdk:6.6.0.7] AndroidManifest.xml:38:18-44 value=(true).
	Suggestion: add 'tools:replace="android:allowBackup"' to <application> element at AndroidManifest.xml:3:4-33:19 to override.
```
解决方案
AndroidManifest.xml添加以下配置
```
<manifest ....
    xmlns:tools="http://schemas.android.com/tools"
    ... >
<application
        ...
        tools:replace="android:label,android:allowBackup"
        android:allowBackup="true"
        ... >
```
