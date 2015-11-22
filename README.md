#Archivos

- ABSManager.h
- ABSManager.m
- AzureDefines.h
- WindowsAzureMobileServices.framework

---
#API obtenerSAS url
*Nombre:* sas
*Parámetros de entrada:* blobName, containerName


#Ejemplo de uso

```
self.manager = [[ABSManager alloc] init];

    //UPLOAD IMAGE
    
    UIImage *testImage = [UIImage imageNamed:@"test.png"];

    [self.manager giveMeSaSURLBlobName:@"test.png"
                         containerName:AZURE_CONTAINER
                      completionSaSURL:^(NSURL *sasURL) {
                          if (sasURL != nil) {
                              [self.manager handleImageToUploadAzureBlob:sasURL
                                                                 blobImg:testImage
                                                    completionUploadTask:^(BOOL result, NSError *error) {
                                                        //Completion block: Yes if all was correct
                              }];
                          } else {
                              NSLog(@"Error al obtener la SAS URL");
                          }
        
                      }];
    
    //DOWNLOAD IMAGE
    [self.manager giveMeSaSURLBlobName:@"test.png"
                         containerName:AZURE_CONTAINER
                      completionSaSURL:^(NSURL *sasURL) {
                          if (sasURL != nil) {
                              [self.manager handleSaSURLToDownload:sasURL
                                               completionHandleSaS:^(UIImage *image, NSError *error) {
                                  //Completion block: here we have the image retrieved
                                                   if (image != nil) {
                                                   
                                                   }
                              }];
                          }
                      }];            
```

