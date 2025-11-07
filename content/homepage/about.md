+++
title = "Inho Choi"
weight = 1
draft = false

role = "Ph.D. Student"
avatar = "images/inho.jpg"
email = "inhochoi@comp.nus.edu.sg"

[organization]
  name = "National University of Singpoare, School of Computing"
  url = "https://www.comp.nus.edu.sg/"

[[social]]
  icon = "envelope"
  iconPack = "fas"
  url = "mailto:inhochoi@comp.nus.edu.sg"

[[social]]
  icon = "linkedin"
  iconPack = "fab"
  url = "https://www.linkedin.com/in/inho-choi-5a8845172/"

[[social]]
  icon = "cv"
  iconPack = "ai"
  url = "https://ihchoi12.github.io/assets/inho_cv.pdf"

[[social]]
  icon = "google-scholar"
  iconPack = "ai"
  url = "https://scholar.google.com/citations?user=ktzRPLoAAAAJ&hl=en"

[widget]
  handler = "about"
    
  # Options: sm, md, lg and xl. Default is md.
  width = ""

  [widget.sidebar]
    # Options: left and right. Leave blank to hide.
    position = ""
    # Options: sm, md, lg and xl. Default is md.
    scale = ""
    
  [widget.background]
    # Options: primary, secondary, tertiary or any valid color value. Default is primary.
    color = "secondary"
    
    # See TODO
    image = ""
    # Options: auto, cover and contain. Default is auto.
    size = ""
    # Options: center, top, right, bottom, left.
    position = ""
    # Options: fixed, local, scroll.
    attachment = ""
+++
##

<p style="font-size:18px; color: #0d15f3d8; background-color: #bdbfc1ff; padding: 15px; border-radius: 8px; border-left: 4px solid #0D8BF3; margin-bottom: 20px;">
<strong>📢 I am graduating soon this year (2025) and currently seeking research positions in systems and networking (both industry and postdoc). I'd be happy to connect and chat!</strong>
</p>

<p style="font-size:20px">
I am a Ph.D. student in Computer Science at the National University of Singapore,
advised by <a href="https://www.comp.nus.edu.sg/~lijl/">Jialin Li</a>. I also closely collaborate with <a href="https://irenezhang.net/">Irene Zhang</a> and <a href="https://drkp.net/">Dan Ports</a>.
</p>

<p style="font-size:18px; margin-top: 15px; line-height: 1.6;">
My research interests lie at the intersection of <strong>distributed systems</strong>, <strong>datacenter networks</strong>, <strong>dataplane operating systems</strong>, and <strong>machine learning for systems</strong>. Currently, I am focusing on designing high-performance systems that leverage programmable hardware and ML-driven optimization to address challenges in modern datacenters.
</p>

<br>

## Education
  <div id="header">
      <p style="float: left; width: 80%; text-align: left;">
        <a href="https://www.comp.nus.edu.sg/~lijl/" class="font-bold">National University of Singapore</a>
      </p>
      <p style="float: left; width: 20%; text-align: right;">
        Singapore
      </p>
      <p style="float: left; width: 80%; text-align: left;">
        Ph.D. Student in Computer Science 
        (Advisor: <a href="https://www.comp.nus.edu.sg/~lijl/" >Jialin Li</a>)
      </p>
      <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
        Aug 2019 — Present
      </p>
      <div style="clear: both;"></div>
      <!--  -->
      <p style="float: left; width: 80%; text-align: left;">
        <a href="https://www.yonsei.ac.kr/en_sc/index.jsp" class="font-bold">Yonsei University</a>
      </p>
      <p style="float: left; width: 20%; text-align: right;">
        Seoul, South Korea
      </p>
      <p style="float: left; width: 80%; text-align: left;">
        Bachelor's Degree in Computer Science
      </p>
      <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
        Mar 2012 — Aug 2019
      </p>
      <div style="clear: both;"></div>
      <!--  -->
      <p style="float: left; width: 80%; text-align: left;">
        <a href="https://www.it.uu.se/" class="font-bold">Uppsala University</a>
      </p>
      <p style="float: left; width: 20%; text-align: right;">
        Uppsala, Sweden
      </p>
      <p style="float: left; width: 80%; text-align: left;">
        Exchange Student in Information Technology
      </p>
      <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
        Aug 2017 - Jan 2018
      </p>
      <div style="clear: both;"></div>
  </div>

<br>

<div id="work-in-progress"></div>

## Work in Progress <span style="font-size:14px; font-style: italic; font-weight: normal; margin-left: 10px;">(projects that I'm currently leading)</span>

  <b>- ML-native Dataplane Operating Systems<span style="color: rgba(13, 139, 243, 1);"> [Current Main Project]</span></b>
  <p style="text-align: justify; line-height: 1.6;">
  We design an ML-native dataplane OS architecture for automatic parameter tuning. Performance tuning remains a persistent challenge in modern datacenters, especially at microsecond scales. We are exploring how machine learning can be natively integrated into the OS dataplane, with case studies showing substantial performance gains through dynamic parameter optimization.
  </p>
  <br>

  <b>- Dynamic Layer-4 Load Balancing with Microsecond-Scale TCP Migration<span style="color: rgba(13, 139, 243, 1);"> [Full Paper Under Review]</span></b>
  <p style="text-align: justify; line-height: 1.6;">
  Layer-4 load balancers are a popular solution to high tail latencies but perform poorly under unpredictable workloads and traffic bursts because they statically assign connections to servers. We propose the first dynamic L4 load balancer with &mu;s-scale stateful connection migration. Our system leverages two trends — programmable switches and kernel-bypass — to efficiently implement TCP migration without packet loss, while maintaining transparency to clients.
  </p>
  <br>

<div id="publications"></div>

## Publications
  <b>[APSYS '25]
  <a href="https://dl.acm.org/doi/pdf/10.1145/3725783.3764392"> ML-native Dataplane Operating Systems </a> </b> <br>
  <b><u>Inho Choi</u></b>, Anand Bonde, Jing Liu, Joshua Fried, Irene Zhang, Jialin Li. <br>
  16th ACM SIGOPS Asia-Pacific Workshop on Systems (APSys 2025) <br>
  <br>

  <b>[ArXiv]
  <a href="https://arxiv.org/pdf/2312.06207"> 
  A Primer on RecoNIC: RDMA-enabled Compute Offloading on SmartNIC</a> </b> <br>
  Guanwen Zhong, Aditya Kolekar, Burin Amornpaisannon, <b><u>Inho Choi</u></b>, Haris Javaid, Mario Baldi. <br>
  ArXiv, Dec, 2023 <br>
  <br>

  <b>[APSYS '23]
  <a href="https://apsys23.skku.edu/program.html"> Capybara: &mu;Second-scale live TCP migration</a> </b> <br>
  <b><u>Inho Choi</u></b>, Nimish Wadekar, Raj Joshi, Joshua Fried, Dan R. K. Ports, Irene Zhang, Jialin Li. <br>
  14th ACM SIGOPS Asia-Pacific Workshop on Systems (APSys 2023) <br>
  [<a href="https://dl.acm.org/doi/pdf/10.1145/3609510.3609813"> PDF </a>]
  <br><br>

  <b>[SIGCOMM '23]
  <a href="https://conferences.sigcomm.org/sigcomm/2023/"> Network Load Balancing with In-network Reordering Support for RDMA</a> </b> <br>
  Cha Hwan Song, Xin Zhe Khooi, Raj Joshi, <b><u>Inho Choi</u></b>, Jialin Li, and Mun Choon Chan. <br>
  Proceedings of the 2023 ACM SIGCOMM Conference <br>
  [<a href="https://dl.acm.org/doi/pdf/10.1145/3603269.3604849"> PDF </a> | 
  <a href="https://www.youtube.com/watch?v=SlCJBGpn_4I"> Talk </a>]
  <br><br>

  <b>[NSDI '23]
  <a href="https://www.usenix.org/conference/nsdi23/presentation/choi"> Hydra: Serialization-Free Network Ordering for Strongly Consistent Distributed Applications</a> </b> <br>
  <b><u>Inho Choi</u></b>, Ellis Michael, Yunfan Li, Dan Ports, and Jialin Li. <br>
  Proceedings of the 20th USENIX Conference on Network Systems Design and Implementation<br>
  [<a href="https://www.usenix.org/system/files/nsdi23-choi.pdf"> PDF </a> | 
  <a href="https://www.youtube.com/watch?v=1TmAhFjczfs"> Talk </a> |
  <a href="https://www.usenix.org/system/files/nsdi23_slides_choi.pdf"> Slide </a>]
  <br><br>
  
  <b>[S\&P '20]
  <a href="https://ihchoi12.github.io/assets/tran2020stealthier.pdf">
  A Stealthier Partitioning Attack against Bitcoin Peer-to-Peer Network</a> </b> <br>
  Muoi Tran, <b><u>Inho Choi</u></b>, Gi Jun Moon, Viet-Anh Vu, and Min Suk Kang. <br>
  In Proceedings of IEEE Symposium on Security and Privacy, May 2020.<br>
  [<a href="https://ihchoi12.github.io/assets/tran2020stealthier.pdf"> PDF </a> | 
  <a href="https://www.youtube.com/watch?v=MYuj7iksxKA"> Talk </a> |
  <a href="https://erebus-attack.comp.nus.edu.sg/"> Website </a>]
  <br><br>
  
  <b>[UbiComp Workshop '17]
  <a href="https://ubicomp-mental-health.github.io/papers/2017/stress-kye.pdf">
  Multimodal Data Collection Framework for Mental Stress Monitoring</a> </b> <br>
  Saewon Kye, Junhyung Moon, Juneil Lee, <b><u>Inho Choi</u></b>, Dongmi Cheon, and Kyoungwoo Lee. <br>
  In Proceedings of the 2017 ACM International Joint Conference on Pervasive and Ubiquitous Computing and Proceedings of the 2017 ACM International Symposium on Wearable Computers. (Workshop Paper) <br>
  [<a href="https://ubicomp-mental-health.github.io/papers/2017/stress-kye.pdf"> PDF </a>]

<br>

<div id="experiences"></div>

## Experiences
  <div>
    <p style="float: left; width: 50%; text-align: left;">
      <a class="font-bold">Microsoft Research</a> - PhD Research Intern
    </p>
    <p style="float: left; width: 50%; text-align: right;">
      Redmond, WA, USA
    </p>
    <p style="float: left; width: 80%; text-align: left;">
      Systems Research Group (Mentor: <a href="https://irenezhang.net/" >Irene Zhang</a>)
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      June 2025 — Sep 2025
    </p>
    <div style="clear: both;"></div>
    <!--  -->
    <p style="float: left; width: 50%; text-align: left;">
      <a class="font-bold">Microsoft Research</a> - PhD Research Intern
    </p>
    <p style="float: left; width: 50%; text-align: right;">
      Redmond, WA, USA
    </p>
    <p style="float: left; width: 80%; text-align: left;">
      Systems Research Group (Mentor: <a href="https://drkp.net/" >Dan Ports</a>)
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      June 2024 — Aug 2024
    </p>
    <div style="clear: both;"></div>
    <!--  -->
    <p style="float: left; width: 50%; text-align: left;">
      <a class="font-bold">AMD </a> - PhD Research Intern
    </p>
    <p style="float: left; width: 50%; text-align: right;">
      Singapore
    </p>
    <p style="float: left; width: 80%; text-align: left;">
       Xilinx - FPGA / System Design Lab (Mentor: <a href="https://www.linkedin.com/in/guanwen-henry-zhong-16817831/?originalSubdomain=sg" >Guanwen Zhong</a>)
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      May 2023 — Aug 2023
    </p>
    <div style="clear: both;"></div>
    <!--  -->
    <p style="float: left; width: 50%; text-align: left;">
      <a class="font-bold">National University of Singapore</a> - Research Intern
    </p>
    <p style="float: left; width: 50%; text-align: right;">
      Singapore
    </p>
    <p style="float: left; width: 80%; text-align: left;">
      Systems & Network Security Lab (Advisor: <a href="https://netsp.kaist.ac.kr/" >Min Suk Kang</a>)
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      Sep 2018 — Feb 2019
    </p>
    <div style="clear: both;"></div>
    <!--  -->
    <p style="float: left; width: 50%; text-align: left;">
      <a class="font-bold">Metlife</a> - Summer Intern
    </p>
    <p style="float: left; width: 50%; text-align: right;">
      Seoul, Korea
    </p>
    <p style="float: left; width: 80%; text-align: left;">
      IT Planning Team
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      July 2018 — Aug 2018
    </p>
    <div style="clear: both;"></div>
    <!--  -->
    <p style="float: left; width: 80%; text-align: left;">
      <a class="font-bold">Yonsei University</a> - Research Intern
    </p>
    <p style="float: left; width: 20%; text-align: right;">
      Seoul, Korea
    </p>
    <p style="float: left; width: 80%; text-align: left;">
      Dependable Computing Lab (Advisor: <a href="http://dclab.yonsei.ac.kr/" >Kyoungwoo Lee</a>)
    </p>
    <p style="float: left; width: 20%; text-align: right; margin-bottom: 20px;">
      Feb 2017 — May 2018
    </p>
    <!--  -->
    <div style="clear: both;"></div>
  </div>

<br>

## Awards
<div>
    <p style="float: left; width: 60%; text-align: left;">
      <a href="https://www.comp.nus.edu.sg/programmes/pg/awards/deans/" class="font-bold">Research Incentive Award</a>
    </p>
    <p style="float: left; width: 40%; text-align: right;">
      National University of Singapore
    </p>
    <p style="float: left; width: 100%; text-align: right; margin-bottom: 20px;">
      Oct 2023
    </p>
    <div style="clear: both;"></div>
    <p style="float: left; width: 60%; text-align: left;">
      <a href="https://www.comp.nus.edu.sg/programmes/pg/awards/deans/" class="font-bold">Research Achievement Award</a>
    </p>
    <p style="float: left; width: 40%; text-align: right;">
      National University of Singapore
    </p>
    <p style="float: left; width: 100%; text-align: right; margin-bottom: 20px;">
      Jan 2023
    </p>
    <div style="clear: both;"></div>
    <p style="float: left; width: 60%; text-align: left;">
      <a href="https://www.comp.nus.edu.sg/programmes/pg/phdcs/scholarships/#financial" class="font-bold">NUS Research Scholarship</a>
    </p>
    <p style="float: left; width: 40%; text-align: right;">
      National University of Singapore
    </p>
    <p style="float: left; width: 100%; text-align: right; margin-bottom: 20px;">
      Aug 2018 - Present
    </p>
    <div style="clear: both;"></div>
    <p style="float: left; width: 60%; text-align: left;">
      <a href="https://cs.yonsei.ac.kr:59290/eng/index.php" class="font-bold">Honors - 1st Semester, 2018</a>
    </p>
    <p style="float: left; width: 40%; text-align: right;">
      Yonsei University
    </p>
    <p style="float: left; width: 100%; text-align: right; margin-bottom: 20px;">
      Aug 2018
    </p>
    <div style="clear: both;"></div>
</div>

<br>

## Mentoring Experiences

<ul>
  <li>
    <b>Yiyang Liu</b> &mdash; NUS, Singapore (2024) <br>
    <i>Master's Thesis:</i> <span style="font-style: italic;">Enhancing Distributed Systems with Hydra: A Software Solution for Scalable Network Ordering</span>
  </li>
</ul>

<br>

## Services

<ul style="list-style-type: disc;">
  <li>
    <div style="overflow: hidden;">
      <span style="float: left;"><b>Reviewer</b></span>
      <span style="float: right; font-style: italic;">ToN '25</span>
    </div>
  </li>
  <li>
    <div style="overflow: hidden;">
      <span style="float: left;"><b>Shadow PC Reviewer</b></span>
      <span style="float: right; font-style: italic;">EuroSys '26, EuroSys '25</span>
    </div>
  </li>
  <li>
    <div style="overflow: hidden;">
      <span style="float: left;"><b>Student Volunteer</b></span>
      <span style="float: right; font-style: italic;">SOSP '21</span>
    </div>
  </li>
</ul>

<br>

## Invited Talks

<ul style="list-style-type: disc;">
  <li>
    <div style="overflow: hidden;">
      <span style="float: left; width: 100%;"><b>Co-Designing Systems for Microsecond-Scale Consistent Tail Latency in Datacenters</b></span>
      <span style="float: right; font-style: italic;">Yonsei University (2025), Seoul National University (2025)</span>
    </div>
  </li>
</ul>
