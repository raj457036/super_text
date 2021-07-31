## 0.1.0

* **SText** with stylesheet 
* **SelectableStext** to create **SText** which is selectable
* **SuperTextStyleProviderc** for providing global stylesheet
* **MaterialTextThemeModifier** for material text themes style
    ```dart
    SText("[style:headline1](Some Text in H1 style.))
    ```
* **EscapeModifiers** for escaping characters
    ```dart
    SText("[escapes](What&quote;s up?)")

    /// results -> What's up?
    ```
* **HyperlinkModifier** for clickable text
    ```dart
    SText("[href:open_link, color:black](separate article)")
    ```


