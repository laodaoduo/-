# -
简单的
//  build-setting 中搜索   PREFIX_HEADER  添加  .h 文件路径（直接托文件过去即可）

#ifndef define_h
#define define_h


//———————————————— 适配
//纯计算：
#define f_Device_w         [UIScreen mainScreen].bounds.size.width
#define f_Device_h  	    [UIScreen mainScreen].bounds.size.height
/// 根据iphone5 的效果图 尺寸比例 算出实际尺寸
#define f_i5real(f)              ( ( (int)( (f_Device_w * ((f)/320.f)) * 2 ) ) / 2.f )
/// 根据iphone6 的效果图 尺寸比例 算出实际尺寸
#define f_i6real(f)              ( ( (int)( (f_Device_w * ((f)/375.f)) * 2 ) ) / 2.f )
/// 根据iphone6 PLUS 的效果图 尺寸比例 算出实际尺寸
#define f_i6Preal(f)              ( ( (int)( (f_Device_w * ((f)/414.f)) * 2 ) ) / 2.f )



//---------------- 处理图片
//获取images.bundle 中的图片
#define GET_IMAGE(name)         [UIImage imageNamed:[NSString stringWithFormat:@"images.bundle/%@",name?name:@"default.png"]]
//自动设置 imgView 的 size :不会改变img的 x，y (普通宏定义 最好一句话写完，如果一定要写在多行中，最好在宏定义的实现外加一层大括号)
#define SET_IMAGE_SIZE(tImgView)     {CGRect frame = tImgView.frame;\
frame.size = CGSizeMake(tImgView.image.size.width/2, tImgView.image.size.height/2);\
tImgView.frame = frame;}

//------------------  数据比较

//#define MIN(a,b)       (a>b?b:a)



#endif /* define_h */
