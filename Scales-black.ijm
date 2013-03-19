// This macro batch processes a folder of images,
// adding scalebars to each image based on the current global calibration.
// All the images must be in TIFF format.
//
// I adapted most of this from http://rsbweb.nih.gov/ij/macros/BatchSetScale.txt
// Steven Cogswell 

   requires("1.33n"); 
   showMessageWithCancel("If you don't have a global calibration set, cancel now"); 
   dir = getDirectory("Choose a Directory ");
   list = getFileList(dir);
   start = getTime();
   //setBatchMode(true); // runs up to 6 times faster
   for (i=0; i<list.length; i++) {
        path = dir+list[i];
        //print(i+"  "+path);
        showProgress(i, list.length);
        open(path);
        filename=File.nameWithoutExtension;
        title = getTitle();
        newFilename=filename+"-";
        newPath=dir+newFilename;
		
        // We inherit from the Global Scale Settings 
		// This is the line to change the style of your scalebar in. 
        run("Scale Bar...", "width=100 height=5 font=18 color=Black background=None location=[Lower Right] bold");

        saveAs("tiff",newPath); 
        close();
  }
  showMessage("All Done");
 // print((getTime()-start)/1000);

