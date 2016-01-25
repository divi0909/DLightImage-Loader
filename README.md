# DLightImage-Loader

###This a very light and fast image loader with very eye catching animation which you can use by importing simply two .h and .m files. There are only two methods to use this loader first to show and another for removal. This loader is very handy for any application.###

####A Loader that set his width height according to screen width and height and fully customizable.####

![alt text](http://idivi.esy.es/images/ezgif.com-resize%20(2).gif "Demo")

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
[loader stopLoader];
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

Happy Coding... :)


