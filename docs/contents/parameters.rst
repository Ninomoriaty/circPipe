Parameters
----------

.. warning :: Those parameters would cover the setting from ``nextflow.config`` file .

Mandatory
^^^^^^^^^

.. note:: plz configure those options in ``nextflow.config`` or ``docker.config`` file .

+--------------+------------------+----------------+
| Name         | Example/Default  | Description    |
|              | value            |                |
+==============+==================+================+
| --reads      | ``./*{1,2}.fq.gz | input raw      |
|              | ``               | paired reads   |
+--------------+------------------+----------------+
| --designfile | ``FALSE``        | a txt file     |
|              |                  | that stored    |
|              |                  | experimental   |
|              |                  | design         |
|              |                  | information,   |
|              |                  | plz see        |
|              |                  | details from   |
|              |                  | ``--designfile |
|              |                  | ``             |
|              |                  | section above  |
+--------------+------------------+----------------+
| --comparefil | ``FALSE``        | a txt file     |
| e            |                  | that stored    |
|              |                  | experimental   |
|              |                  | compare        |
|              |                  | information,   |
|              |                  | plz see        |
|              |                  | details from   |
|              |                  | ``--comparefil |
|              |                  | e``            |
|              |                  | section above  |
+--------------+------------------+----------------+

Configuration
^^^^^^^^^^^^^

    (paths to references, softwares and special environments. Only need
    to be set at the first time you run the pipeline.We recommanded users to build a fixed config profile or edit our ``base.config`` based on their own service, and use the paratemeter ``--profile *.config`` to invoke these parameters.) .

+--------------+-----------------+----------------+
| Name         | Example/Default | Description    |
|              | value           |                |
+==============+=================+================+
| --redir      | ``/path/to/refd | the folder     |
|              | ir``            | containing all |
|              |                 | reference      |
|              |                 | files and      |
|              |                 | index          |
+--------------+-----------------+----------------+
| --genomefile | ``path/to/refdi | Path to Fasta  |
|              | r/chr2.fa``     | reference(requ |
|              |                 | ired           |
|              |                 | if not set in  |
|              |                 | config file)   |
+--------------+-----------------+----------------+
| --gtffile/-- | ``path/to/refdi | Different      |
| bedfile/--an | r/hg38_gencode. | annotation     |
| notationfile | txt``           | files from     |
|              |                 | GENCODE        |
|              |                 | database for   |
|              |                 | annotating     |
|              |                 | circRNAs. e.g. |
|              |                 | [gencode.v25.a |
|              |                 | nnotation.gtf] |
|              |                 | /[gencode.v25. |
|              |                 | annotation.bed |
|              |                 | ]/[hg38\_genco |
|              |                 | de.txt]        |
+--------------+-----------------+----------------+
| --ciridir/-- | ``/path/to/tool | Home folder of |
| find\_circdi | s/directory``   | ciri/find\_cir |
| r/--mapsdir/ |                 | c/mapsplice/kn |
| --knifedir   |                 | ife            |
|              |                 | installed      |
|              |                 | location       |
+--------------+-----------------+----------------+

Optional
^^^^^^^^
The following parameters may vary from projects to projects, therefore we recommanded users to add these parameters in the command line, which may be more flexible.
+--------------+-----------------+----------------+
| Name         | Default value   | Description    |
+==============+=================+================+
| --starindex/ | ``-``           | Path to        |
| --bowtie2ind |                 | STAR/bowtie2/s |
| ex/--bwainde |                 | egemehl/bowtie |
| x/--segindex |                 | /bwa/mapsplice |
| /--bowtieind |                 | /knife         |
| ex/--refmaps |                 | index. If not  |
| plice/--knif |                 | set, the       |
| eindex       |                 | pipeline will  |
|              |                 | create the     |
|              |                 | index itself.  |
+--------------+-----------------+----------------+
| --singleEnd  | ``false``       | specify that   |
|              |                 | the reads are  |
|              |                 | single ended   |
+--------------+-----------------+----------------+
| --selectTool | ``1``           | specify which  |
| s            |                 | tools should   |
|              |                 | be use. ``1``  |
|              |                 | for            |
|              |                 | circexplorer2, |
|              |                 | ``2`` for      |
|              |                 | ciri, ``3``    |
|              |                 | for            |
|              |                 | find\_circ,    |
|              |                 | ``4`` for      |
|              |                 | mapsplice,     |
|              |                 | ``5`` for      |
|              |                 | segemehl,      |
|              |                 | ``6`` for      |
|              |                 | knife. For     |
|              |                 | example, you   |
|              |                 | can set        |
|              |                 | ``1,2,3,4,5``  |
|              |                 | for running    |
|              |                 | five tools in  |
|              |                 | the same time. |
+--------------+-----------------+----------------+
| --outdir     | ``./Result``    | the output     |
|              |                 | directory of   |
|              |                 | the results    |
+--------------+-----------------+----------------+
| --mRNA       | ``path/to/genco | Path to the    |
|              | de.rsem.fpkm_m6 | mRNA           |
|              | Astatus_11_29.m | expression     |
|              | at``            | matrix. Only   |
|              |                 | need to be set |
|              |                 | when you want  |
|              |                 | to do the      |
|              |                 | correlation.   |
+--------------+-----------------+----------------+

Detailed instruction of parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-  ``--reads``

   suffix of your raw reads file. For example, ``*_{1,2}.fq.gz`` for
   paired end reads file ``sampleA_1.fq.gz`` and ``sampleA_2.fq.gz``

-  ``--outdir``

   path to the result output directory

-  `` --skip_fastp``

   run circPipe without the step of QC,which is suit for QC-ready reads.
   
-  ``--selectTools``

   specify which tools should be use. ``1`` for circexplorer2, ``2`` for
   ciri, ``3`` for find\_circ, ``4`` for mapsplice, ``5`` for segemehl,
   ``6`` for knife. For example, you can set
   ``--selectTools='1,2,3,4,5'`` for running five tools in the same
   time.

-  ``--starindex``

   path to the STAR index directory. To build the index, you can use the
   command such as
   ``STAR --runMode genomeGenerate --runThreadN 1 --genomeDir /home/wqj/test/starindex --genomeFastaFiles /home/wqj/database/circleTest/1.genome/chrX.fa --sjdbGTFfile /home/wqj/database/circleTest/1.genome/gencode.v25.annotation.chrX.gtf --sjdbOverhang 149``.

-  ``--segindex``

   path to the Segemehl index directory. To build the index, you can use
   the command such as ``./segemehl.x -d hg19.fa -x hg18.idx``.

-  ``--bowtie2index``

   path to the Bowtie2 index directory. To build the index, you can use
   the command such as ``bowtie2-build -f ../chrX.fa chrX``.

-  ``--bowtieindex``

   path to the Bowtie index directory. To build the index, you can use
   the command such as ``bowtie-build GENOME.fa GENOME``.

-  ``--bwaindex``

   path to the BWA index directory. To build the index, you can use the
   command such as
   ``bwa index /home/wqj/database/circleTest/1.genome/chrX.fa -p genome``.

-  ``--knifeindex``

   path to the KNIFE index directory. To build the index, you can follow
   the step in README.md in
   https://github.com/lindaszabo/KNIFE/tree/master/createJunctionIndex.

-  ``--designfile``

   design file

-  ``--comparefile``

   compare file

-  ``--mRNA``

   mRNA expression matrix file

-  ``--gtffile``

   gtf file for building your STAR index, running CIRI and Mapsplice,
   running annotation. For example, ``gencode.v25.annotation.gtf``.

-  ``--genomefile``

   whole genome reference sequence in ``.fa`` format for running
   CIRCexplorer2, CIRI, Segemehl, Find\_circ. For example,
   ``genome.fa``.

-  ``--annotationfile``

   annotation file of genome in ``.txt`` format for running
   CIRCexplorer2. For example, ``hg38_gencode.txt``.

-  ``--bedfile``

   annotation file of genome in ``.bed`` format for running
   CIRCexplorer2. For example, ``gencode.v25.annotation.bed``.

-  ``--refmapsplice``

   path to the reference files for Mapsplice directory.

-  ``--refdir``

   path to the directory including all reference genome files and
   indexes files.

-  ``--singleEnd``

   ``true`` when using a single End reads input, default ``false``

-  ``--ciridir``

   path to the CIRI scripts

-  ``--find_circdir``

   path to the Find\_circ scripts

-  ``--mapsdir``

   path to the Mapsplice scripts

-  ``--knifedir``

   path to the KNIFE scripts

-  ``--otherTools``

   path to the in house R,Python,Java scripts

Configure profiles 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As a nextflow-based analysis pipeline, CircPipe allow users edit configure file ``nextflow.config`` to set the index files and default file path parameters, and use the ``--profile nextflow.config`` instead of typing them into the command line.

To configure, please go to ``params`` line, and set the following information of various file locations and system environment settings

.. code:: groovy

    params {

      container = 'likelet/circpipe:latest' // Container slug. Stable releases should specify release tag!

      //choose the tools
      separate = false
      merge = false
      selectTools = '6'

      //the necessary reference
      refdir = '/data1/wqj/database/data/testdata/Genome'
      annotationfile = "${params.refdir}/hg38_chr2_gencode.txt"
      genomefile = "${params.refdir}/chr2.fa"
      gtffile = "${params.refdir}/gencode_chr2.v25.annotation.gtf"
      bedfile = "${params.refdir}/gencode_chr2.v25.annotation.bed"
      refmapsplice = "${params.refdir}"
      mRNA = "/data1/wqj/database/data/testdata/gencode.rsem.fpkm_m6Astatus_11_29.mat"

      //reads files
      reads = "./*{1,2}.fq.gz"

      //the indexes for tools
      starindex = ""
      segindex = ""
      bowtie2index = ""
      bowtieindex = ""
      bwaindex = ""
      knifeindex = ""

      //the output directory
      outdir = './Result'

      //tools directory
      ciridir = '/home/wqj/tools/CIRI/bin/CIRI_v2.0.6'
      find_circdir = '/home/wqj/tools/find_circ'
      mapsdir = '/home/wqj/miniconda3/envs/tools_in_python3/bin'
      knifedir = '/home/wqj/tools/KNIFE'
      otherTools = "$baseDir/bin"

      //files of DE
      designfile='/data1/wqj/database/data/testdata/design.file'
      comparefile='/data1/wqj/database/data/testdata/compare.file'

      singleEnd = false

      email = '513848731@qq.com'

      help = false
      igenomes_base = "./iGenomes"
      tracedir = "${params.outdir}/pipeline_info"
      clusterOptions = false
      awsqueue = false
      awsregion = 'eu-west-1'

    }
    // Capture exit codes from upstream processes when piping
    process.shell = ['/bin/bash', '-euo', 'pipefail']

    timeline {
      enabled = true
      file = "${params.tracedir}/nf-core/cirpipe_timeline.html"
    }
    report {
      enabled = true
      file = "${params.tracedir}/nf-core/cirpipe_report.html"
    }
    trace {
      enabled = true
      file = "${params.tracedir}/nf-core/cirpipe_trace.txt"
    }
    dag {
      enabled = true
      file = "${params.tracedir}/nf-core/cirpipe_dag.svg"
    }

    manifest {
      name = 'nf-core/cirpipe'
      author = 'Qi Zhao(zhaoqi@sysucc.org.cn), Qijin Wei(513848731@qq.com)'
      homePage = 'https://github.com/likelet/cirpipe'
      description = 'cirRNA analysis pipe'
      mainScript = 'main.nf'
      nextflowVersion = '>=0.32.0'
      version = '1.0dev'
    }
