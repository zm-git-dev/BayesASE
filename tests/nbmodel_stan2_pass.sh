 #!/bin/bash
date;hostname;pwd
#    <tests>
#        <test>
#            <param name="design" ftype="data" value="BASE_testdata/run_bayesian_testdata/comparate_df_two_conditions_BASE.tsv"/>
#            <param name="cond" ftype="text" value="2" />
#            <param name="iterations" ftype="text" value="100000" />
#            <param name="warmup" ftype="text" value="10000" />
#            <param name="collection">
#              <collection type="list">
#                <element name="collection" value="BASE_testdata/run_bayesian_testdata/bayesian_input_W55_M_V"/>
#              </collection>
#             </param>
#             <output_collection name="split_output" type="list">
#               <element name="comparison">
#                 <assert_contents>
#                   <has_text_matching expression="W55_M_V" />
#                  </assert_contents>
#                </element>
#              </output_collection>
#        </test>
# collection dir:  galaxy/test-data/nbmodel

### works with full path to TESTDIR but not relative --> AMM thinks can (1) adding library(here) to R code will fix or (2) can modify python code to get current path and send into R code
TEST="nbmodel_stan2"
TESTDIR="testout/${TEST}"
rm -rf ${TESTDIR}
mkdir -p ${TESTDIR}
echo "### Starting test: ${TEST}"

src/scripts/nbmodel_stan2.py "$@" \
    --design galaxy/test-data/bayesian_input/comparate_design_file.tsv \
    --collection_identifiers bayesian_input_W55_M_V \
    --collection_filenames galaxy/test-data/bayesian_input/bayesian_input_W55_M_V.tabular \
    --outdir ${TESTDIR} \
    --cond 2

date
echo "### Finished test: ${TEST}"
