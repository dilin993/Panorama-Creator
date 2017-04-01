imagePaths = getImgFiles();
job = batch('featureFindingWorker','Profile','local','Pool',1);
wait(job)   % Wait for the job to finish
diary(job)  % Display the diary
