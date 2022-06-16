import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';

import '../../pages/home/project/project_detail.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) =>  ProjectDetail(project: project,))),
      child: Container(
          margin: const EdgeInsets.only(top: 15.0, right: 25.0, bottom: 2),
          width: 300,
          height: 350,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  offset: const Offset(5, 15),
                  blurRadius: 15,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    project.name,
                    style: const TextStyle(
                      fontSize: 15.5,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      project.year.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Hero(
                tag: project.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    project.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                project.description,
                style: const TextStyle(fontSize: 14),
              )
            ],
          )),
    );
  }
}
