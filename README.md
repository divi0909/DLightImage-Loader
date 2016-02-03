# DLightImage-Loader

###This a very light and fast image loader with very eye catching animation which you can use by importing simply two .h and .m files. There are only two methods to use this loader first to show and another for removal. This loader is very handy for any application.###

####A loader that can be customized for every app with his app icon.####

![alt text](http://idivi.esy.es/images/ezgif.com-resize%20(2).gif "Demo")
![alt text](http://idivi.esy.es/images/ezgif.com-resize.gif "Demo2")

Import .h and .m file of loader in your project then to use this loader simply create intance of loader in your .h file of viewController
```ruby
@property(strong,nonatomic) DImageLoader *loader;")
```

After this you have to initialize loader class before showing loader in view
```ruby
loader = [DImageLoader shareInstance];
```
To show loader on View call
```ruby
[loader startLoaderOnView:yourView];
```
To remove loader from view call
```ruby
[loader stopLoaderOnView:yourView];
```

There are some properties which you can customize

#####(1) if you want to customize images and put your own images in loader then call these methods or set properties#####
Note:- Image of 50x50 for iPhone and 100x100 will give best result in animation
```ruby
loader.onImage = yourImage;
loader.offImage = yourImage;

or

[loader setOnImage:yourImage];

[loader setOffImage:yourImage];
```

#####(2) increaseFactor-> This factor is used for Image increament animation in loader which can be set by simply calling function#####
```ruby
[loader setIncreaseFactor:(CGFloat)factor];
```

#####(3) AnimationDuration-> This property is used for determine animation duration of one image of loader which is default set to 0.3.####
set this by calling
```ruby
[loader setAnimationDuration:(CGFloat)duration];
```
#####(4) textColor-> This property is used for setting textcolor of your loader text.####
```ruby
loader.textcolor = [UIColor redColor];
```
#####(5) font-> This property is used for setting font of your loader text.####

```ruby
loader.font = [UIFont yourFont];
```

#####(6) text-> This property is used for setting text for your loader.####
```ruby
loader.text = @"Your Text Here";
or
[loader showText:@"Your Text Here" andFont:yourFont];
```
Happy Coding... :)


