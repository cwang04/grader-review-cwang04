CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

filepath='student-submission/ListExamples.java'


if [[ -f $filepath ]]
then
    cp $filepath ./grading-area
    cp TestListExamples.java ./grading-area
else
    echo 'Did not submit the correct file'
    exit
fi

cd "grading-area"
javac -cp $CPATH "*.java"
if [[ $? -ne 0 ]]
then 
    echo 'Compile Error'
    exit
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > grades.txt

score="$(($num-$(grep -c "failure:" grades.txt)))"
echo "Your score is: " $score "/" $num 
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
exit 0