CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

filepath=$(find student-submission -type f -name "ListExamples.java")

if [[ -f $filepath ]]
then
    cp $filepath "./grading-area"
    cp TestListExamples.java "./grading-area"
else
    echo 'Did not submit the correct file'
    exit


javac -cp ".;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" "./grading-area/*.java"
if [[ $? -ne 0 ]]
then 
    echo 'Compile Error'
    exit
fi
java -cp ".;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > grades.txt
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
exit