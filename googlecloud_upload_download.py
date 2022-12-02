#!/usr/bin/env python
# coding: utf-8

# In[51]:


# vars(booktonotes)
## upload files:
import os,sys,subprocess
from google.cloud import storage
import pandas as pd
os.environ['GOOGLE_APPLICATION_CREDENTIALS']='book2notes1-bd15141c7884.json'
storage_client=storage.Client()
bucket_name='booktonotes_data'
fileformat=['.pdf','.html']

home_directorypath='/home/atul'
folder_at_serverwithoutip=''
thisbookname=""
currentpagenumber=""

def upload_to_bucket(blob_name,file_path,bucket_name):
    try:
        bucket=storage_client.get_bucket(bucket_name)
        blob=bucket.blob(blob_name)
        blob.upload_from_filename(file_path)
        return True
        
    except Exception as e:
        print (e)
        return False

    

# upload_to_bucket('test/test.txt,test.txt,bucket_name)


# In[63]:


## download files:
def download_from_bucket(blob_name,file_path,bucket_name):
    try:
        bucket=storage_client.get_bucket(bucket_name)
        blob=bucket.blob(blob_name)
        with open(file_path,'wb') as  f:
            storage_client.download_blob_to_file(blob,f)
        # blob.upload_from_filename(file_path)
        return True
        
    except Exception as e:
        print (e)
        return False

# download_from_bucket('test/test','test3.txt','booktonotes_data')

    


# In[46]:


## upload a book:
def call_upload_to_bucket_for_completebook_sh():
    bookfoldername=sys.argv[1]
    bookpagename=sys.argv[2]
    fileformat='.pdf' #sys.argv[3]
    filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename+fileformat)
    filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename+fileformat)
    upload_to_bucket(filepathnameingooglebucket,filepathnameinlocalcomputer,bucket_name)


# # In[47]:


# ## push a complete pdf book to google cloud:



# # In[48]:


# # dir(storage_client)
# booktonotes=storage_client.get_bucket(bucket_name)


# # In[49]:


# ## upload file:
# ## upload pdf file to the google 


# # In[50]:


# # for x in storage_client.list_buckets():
# #     ## print bucket details:
# #     print(vars(x))


# # In[71]:


# # client = storage.Client()
# # BUCKET_NAME = bucket_name
# # bucket = client.get_bucket(BUCKET_NAME)
# # current_bookname="test"
# # blobs = bucket.list_blobs()
# # print(blobs)
# # filesname=[]
# # for blob in blobs:
# #     print(os.path.dirname(blob.name))
# #     if current_bookname==blob.name:
# #         filesname.append(blob.name)
# # df=pd.DataFrame(filesname)
# # df.columns=['Filename']
# # # df.to_csv(,index=False)
# # # filesname


# # In[76]:


# # def get_listof
# ## if file exists in the google cloud:
# def check_blob_in_google_cloud(bucket_name,blob_name):
#     try:
#         bucket=storage_client.get_bucket(bucket_name)
#         blob=bucket.blob(blob_name)
#         # print(blob.exists())
#         return blob.exists()
#     except Exception as e:
#         print (e)
#         return False
    
    
    


# # In[77]:


# # #!/bin/bash
# # echo " I am digitalocean , swimming!"
# # filename_noext=${1}
# # filename_pdf=${filename_noext}.pdf
# # filename_png=${filename_noext}.png
# # filename_svg=${filename_noext}.svg

# # #pdftoppm ${filename_pdf} ${filename_noext}  -png -f 1  -singlefile  -rx 300 -ry 300 
# # convert -density 300 ${filename_pdf}  -resize 75%  ${filename_png}
# # convert ${filename_png}  ${filename_svg}   ##${filename_pdf}
# # #inkscape  -l  ${filename_svg} ${filename_pdf}
# # rm ${filename_png}
# # rm ${filename_pdf}
# blob_name='test/testsjdklf.txt'
# html_file_blob=os.path.join(bookfoldername,bookpagename,fileformat)
# check_blob_in_google_cloud(bucket_name,blob_name)
# if check_blob_in_google_cloud(bucket_name,html_file_blob):
#     call_download_from_bucket(bookfoldername,bookpagename,fileformat)
# ## check for pdf file:

# ## check for html file:

    

# # bucket_name


# # In[21]:


# def call_upload_to_bucket(bookfoldername,bookpagename,fileformat):
#     filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename,fileformat)
#     filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename,fileformat)
#     upload_to_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# def call_download_from_bucket(bookfoldername,bookpagename,fileformat):
#     filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename,fileformat)
#     filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename,fileformat)
#     if check_blob_in_google_cloud(bucket_name,filepathnameingooglebucket):
#         download_from_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# def check_if_a_page_present_indigitalocean(folder_at_serverwithoutip,thisbookname,currentpagenumber,pagefileformat):
#     filename=folder_at_serverwithoutip+thisbooknamewithpagenum+pagefileformat
#     if os.path.exists(filename):
#         return True
#     else:
#         return False
# def create_a_pdfpage_in_digitalocean(folder_at_serverwithoutip,thisbookname,currentpagenumber):
#     if not check_if_a_page_present_indigitalocean(folder_at_serverwithoutip,thisbookname,currentpagenumber,pagefileformat)
#         command= shell.run(["/snap/bin/pdftk", folder_at_serverwithoutip+thisbookname+'.pdf' , "cat", str(currentpagenumber)+"-"+str(currentpagenumber), "output" , folder_at_serverwithoutip+thisbookname+str(currentpagenumber)+'.pdf'])
#         subprocess.call(command,shell=True)
    


# # In[ ]:


# # # download_from_bucket('test','test2.txt','booktonotes_data')
# # # bookfoldername=''
# # # bookpagename=''
# # def call_upload_to_bucket_sh():
# #     bookfoldername=sys.argv[1]
# #     bookpagename=sys.argv[2]
# #     fileformat=sys.argv[3]
# #     filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename,fileformat)
# #     filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename,fileformat)
# #     upload_to_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# # def call_download_from_bucket_sh():
# #     bookfoldername=sys.argv[1]
# #     bookpagename=sys.argv[2]
# #     fileformat=sys.argv[3]
# #     filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename,fileformat)
# #     filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename,fileformat)
# #     download_from_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# # # html_filepathnameinlocalcomputer=os.path.join(home_directorypath,bookfoldername,bookpagename,fileformat)

# # # html_filepathnameingooglebucket=os.path.join(bookfoldername,bookpagename,fileformat)


# # # upload_to_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# # # upload_to_bucket(pdf_filepathnameingooglebucket,pdf_filepathnameinlocalcomputer,bucket_name)
# # # download_from_bucket(html_filepathnameingooglebucket,html_filepathnameinlocalcomputer,bucket_name)
# # # download_from_bucket(pdf_filepathnameingooglebucket,pdf_filepathnameinlocalcomputer,bucket_name)

