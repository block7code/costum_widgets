# costum_widgets

A set of costum_widgets flutter widgets to help you save time building your layouts.

Add the plugin:

# Basic Usage (CustomCheck)

```dart
   CustomCheck(
      value: true,
      activeColor: Colors.green,
      type: CheckType.circle,
      size: 24,  
      onChanged: (value){
        
      },
    )
   ```
   * custom builder
   
   ```dart
   CustomCheck(
      value: value,
      activeColor: Colors.green,
      type: CheckType.circle,
      size: 24,
      builder: (ctx, size) {
        return Icon(
          Icons.star,
          color: Colors.white,
          size: size,
        );
      },
      onChanged: (value) {
        
      },
    )
   ```
   
# Basic Usage (CustomSwitch)

```dart
  CustomSwitch(
      value: value,
      activeColor: Colors.green, 
      pointColor: Colors.white, 
      onChanged: (value){
        
      },
    )
   ```
   
# Basic Usage (Txt)

```dart
  Txt(
    'Click here',
    textSize: 28,
    textAlign: TextAlign.center,
    rich: Rich(
        key: 'here',
        onRichTap: (value) {
          print('onRichTap: ${value}'); 
        },
        style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline
            )
        ),
  )
   ```
   
   ```dart
   Txt(
       'click_message',
        textSize: 28,
        textAlign: TextAlign.center,
        builderText: (value) => 'Click here',
   ),
   ```
   
# Basic Usage (Button)
   * DefaultButton 
   
   ```dart
   DefaultButton(
        value: 'Click',
        activeColor: Colors.green,
        textColor: Colors.white,
        onPressed: () {},
   ) 
   ``` 
   * CustomProgressButton 
   
  ```dart
   CustomProgressButton(
        isLoading: isLoading,
        border: 16.0,
        ignorePlatform: true,
        onPressed: () async {
          setState(() => isLoading = !isLoading);
          await Future.delayed(Duration(seconds: 2));
          setState(() => isLoading = !isLoading);
        },
        value: 'Click',
        activeColor: Colors.green,
   )
   ```
   
## Preview (CustomCheck)

<img src="/screenshots/image_ch0.png" height="300"> 
<img src="/screenshots/image_ch1.png" height="300">  
<img src="/screenshots/image_ch2.png" height="300"> 
<img src="/screenshots/image_ch3.png" height="300"> 

## Preview (CustomSwitch)

<img src="/screenshots/image_sw0.png" height="300"> 
<img src="/screenshots/image_sw1.png" height="300">   

## Example

<img src="/screenshots/screen1.png" width="280" height="500">  |
<img src="/screenshots/screen2.png" width="280" height="500">  

## Widgets currently available

* Switch
* Check 
* Text 
* Button 

If you have any features you want to see in this app, feel free to make a suggestion. 🎉

## Don't forget to give it a ⭐ this motivates me to share more open source.
