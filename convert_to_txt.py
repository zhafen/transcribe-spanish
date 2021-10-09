#!/usr/bin/env python
# coding: utf-8

# In[28]:


import verdict
import sys


# In[29]:


fp = sys.argv[1]


# In[33]:


output_fp = fp.replace( 'json', 'txt' )


# In[34]:


data = verdict.Dict.from_json( fp )


# In[35]:


output_str = ''
for i, result in enumerate( data['results'] ):
    for j, alternative in enumerate( result['alternatives'] ):
        output_str += alternative['transcript'] + '\n'


# In[37]:


with open( output_fp, 'w' ) as f:
    f.write( output_str )


# In[ ]:




