# End-to-end Deep Learning of Optimization Heuristics
[Chris Cummins](https://chriscummins.cc/),
[Pavlos Petoumenos](http://homepages.inf.ed.ac.uk/ppetoume/),
[Zheng Wang](http://www.lancaster.ac.uk/staff/wangz3/),
[Hugh Leather](http://homepages.inf.ed.ac.uk/hleather/).

**Winner of Best Paper Award PACT'17**

<a href="https://speakerdeck.com/chriscummins/end-to-end-deep-learning-of-optimization-heuristics-pact-17">
  <img src="slides.png" height="325">
</a>
<a href="https://github.com/ChrisCummins/paper-end2end-dl/raw/master/paper.pdf">
  <img src="paper.png" height="325">
</a>

**Abstract:**
> Accurate automatic optimization heuristics are necessary for dealing with the
> complexity and diversity of modern hardware and software. Machine learning is
> a proven technique for learning such heuristics, but its success is bound by
> the quality of the features used. These features must be hand crafted by
> developers through a combination of expert domain knowledge and trial and
> error. This makes the quality of the final model directly dependent on the
> skill and available time of the system architect.
>
> Our work introduces a better way for building heuristics. We develop a deep
> neural network that learns heuristics over raw code, entirely without using
> code features. The neural network simultaneously constructs appropriate
> representations of the code and learns how best to optimize, removing the need
> for manual feature creation. Further, we show that our neural nets can
> transfer learning from one optimization problem to another, improving the
> accuracy of new models, without the help of human experts.
>
> We compare the effectiveness of our automatically generated heuristics against
> ones with features hand-picked by experts. We examine two challenging tasks:
> predicting optimal mapping for heterogeneous parallelism and GPU thread
> coarsening factors. In 89% of the cases, the quality of our fully automatic
> heuristics matches or surpasses that of state-of-the-art predictive models
> using hand-crafted features, providing on average 14% and 12% more performance
> with no human effort expended on designing features.

```
@inproceedings{cummins2017b,
  title={End-to-end Deep Learning of Optimization Heuristics},
  author={Cummins, Chris and Petoumenos, Pavlos and Wang, Zheng and Leather, Hugh},
  booktitle={PACT},
  year={2017},
  organization={ACM}
}
```

See [`code/README.md`](code/) for instructions on re-producing the experiments.

![DeepTune](deeptune.png)

## License

The code for this paper (everything in the directory `code`) is released under
the terms of the GPLv3 license. See [LICENSE](LICENSE) for details. Everything
else (i.e. the LaTeX sources and data sets) are unlicensed, please contact
Chris Cummins <chrisc.101@gmail.com> before using.

## Acknowledgements

* EPSRC grants
  EP/L01503X/1 ([CDT in Pervasive Parallelism](http://pervasiveparallelism.inf.ed.ac.uk/)),
  EP/M01567X/1 (SANDeRs),
  EP/M015793/1 (DIVIDEND),
  and EP/P003915/1 (SUMMER).
