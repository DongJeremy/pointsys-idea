package org.cloud.point.api.service;

import org.quartz.JobDataMap;
import org.quartz.SchedulerException;

import org.cloud.point.base.BaseService;
import org.cloud.point.domain.JobModel;

public interface JobService extends BaseService<JobModel> {

    void saveJob(JobModel jobModel);

    void doJob(JobDataMap jobDataMap);

    void deleteJob(Long id) throws SchedulerException;

    JobModel getByName(String jobName);
}
