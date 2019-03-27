Quick start with test data
==========================

Before running circPipe, users should check if all the required tools
and databases are available on the system(that is, either on the local
machine or on the HPC facility).circPipe accepts raw reads, annotations
and genome reference as input to process the whole pipeline. At present,
we mainly focus on human genom.Noteworthily, the reference of our test data contains only one chromesome, Mapsplice can't distinguish this, so users should choose other kinds of software except for Mapsplice to run test data. 

Here, we will exhibit step by step the usage of circPipe using our test
data in a linux system as an example.

Step 1. Download the test data set
----------------------------------

::

    wegt http://cancerbio.info/pub/circpipe/testdata.tar.gz
    tar -xvzf testdata.tar.gz
    cd testdata

Step 2. Install NextFlow
------------------------

.. code:: bash

    curl -fsSL get.nextflow.io | bash
    mv nextflow ~/bin/

Step 3. Get the lastest circPipe
--------------------------------

::

    mkdir -p ~/my-pipelines/
    git clone https://github.com/likelet/circPipe.git
    cd ~/my_data/
    nextflow run ~/my-pipelines/circPipe

Step 4. Pipeline configuration
------------------------------

By default, the circPipe runs with the ``standard`` configuration
profile `conf/base.config <https://github.com/likelet/circPipe/blob/master/conf/base.config>`_ under the github . 

Step 3. Run the analysis command
--------------------------------

::

    #(Make sure all the config files have got ready as our pipeline demand)
     nextflow -c nextflow.config main.nf

Result content(expected result)
-------------------------------

.. note:: After finishing running the pipeline, users will get the final results,the details are described in the part of ``output`` section


Run information
---------------

to be filled 
