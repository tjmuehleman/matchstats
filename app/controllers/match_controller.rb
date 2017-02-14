
class MatchController < ApplicationController
  def set


    body = params['Body']

    # split -- first name is winner
    spl = body.split(" ")

    @winner = spl[0]
    @loser = spl[1]

    # if body simply says "quote" skip saving this and just pull a random quote and respond with that
    if @winner == "quote"
      @just_quote = true

      @quote = get_random_quote(@loser)

    else
      @just_quote = false

      @quote = get_random_quote(@loser)

      puts @winner
      puts @loser

      data= {
        meta_instance_id: "uuid:#{SecureRandom::uuid}",
        winner: @winner.downcase,
        loser: @loser.downcase,
        date_of_match: Date.today.to_s
        }

      api_token = ENV['api_token']

      endpoint = "https://www.securedatakit.com/api/datasets/matches2/records/create?api_token=#{api_token}"

      response = HTTParty.post(endpoint,
                           :body => data.to_json,
                           :headers => { "Content-Type" => 'application/json'})

    end

    render :layout => false

  end

  def get_random_quote(loser)

    arr = ["is a clown","is a dummy!","is one of the dumbest of all pundits","has no sense of the real world!","is closing in on being the dumbest of them all","doesn’t have a clue","is a disaster","is a dope!","knows nothing","is a dumb group!","is trying to extort $1,000,000.00 from me","is so disgraceful!","tried to extort $1,000,000 from me","is a total loser!","tried to shake me down for one million dollars","is a great big phony","represents conservative values terribly & are bad for America","asked me for $1 million. I said no & they went negative. Extortion!","went hostile w/ a series of incorrect & ill-informed ads","is a total fraud","is so unbelieveably crooked","is falsely advertising","is so little respected","is a total hypocrite!","is a great big phony","is a big fat mistake","is a failed 'Bushy' & PA Governor","shouldn't be allowed to do bias commentary","has a faulty thought process","is a failed Jeb Bushy","never says anything good & never will","shouldn't even be on the air!","should be fired!","is so biased","is totally unfair","still thinks Romney won","is a dummy","has no credibility","is a loser","is pushing Republicans down the same old path of defeat","is dopey","is an establishment flunky","should get a life","just totally bombed","has ZERO credibility","is an establishment dope","has made so many mistakes","is part of the Republican Establishment problem","is an all talk, no action dummy!","is a total fool","purposely mischaracterized my statement","is a big fat moron","is a biased dope","is easy to beat!","spent $430 million and lost ALL races","wasted $400 million","didn't win one race","is a total loser","is a clown with zero credibility","is an irrelevant clown, sweats and shakes nervously","has no credibility","is a Bush plant who called all races wrong","is a dopey political pundit","is one of the dumber people on television","is a fraud","is just pathetic","is paid for by the politicians bosses","is a total #Mediafraud","is a joke!","is in pocket of Wall Street","is owned by the banks","took hundreds of thousands of dollars in gifts","is bought and paid for by special interests!","is a terrible representative of Evangelicals","is a nasty guy with no heart!","is a total clown","is a low-class slob","knows nothing about me or my religion","came to my office looking for work","is a total disaster for Republicans & America","is a total disaster","is failing so badly that it will soon be taken off thr air","is close to death","is a dead T.V.","should be put to sleep","is a total loser","is sloppy","is grubby","is a total mess-big crime","is going through massive attacks to its people by the migrants allowed to enter the country","is a total phony and con man","is a total phony","is just a dishonest guy","asked me for expensive hotel rooms","is a bad guy!","is a total scam on our system and country","is a total waste of money","has too much staff being paid way too much money","is a toy by comparison","is a V.P.candidate who failed badly","has a dead campaign","is terrible at business","did such a horrible job","is a waste","is all talk, no action","is a very stupid, highly incompetent person running our country into the ground","is just plain incompetent","is in total disarray","is a dishonest journlist","is part of the dishonest media","is losing too much money. Great news!","is going out of business","has no money, no cred!","is a  very untalented reporter","is considered by many in the world of politics to be the dumbest and most slanted of the political sites","is a scam!","is dishonest","is pure scum","is so dishonest!","has no power","is a clown","is a serious hater","is really dishonest","is losing lots of money","is not read or respected by many","goes out of their way to distort truth!","covers me more inaccurately than any other media source","is an incompetent judge!","has embarrassed all by making very dumb political statements about me","has a mind that is shot","should resign!","is totally ineffective & has been for years","questioned me in such a nasty fashion","is bad at math, nobody cares what they say in their editorials anymore, especially me!","reported 'Cruz momentum' but nothing about the fact that I easily won!","is so dishonest","so totally wrong","loves to write badly about me","looks like a tabloid","is ever-dwindling","HAS BAD JUDGEMENT","is really dumb","should never have been written","is back to doing very sleazy and dishonest 'pushpolls' on me","is begging for money like a dog","is biased","is a @FoxNews flunky","is a Iraq war monger","is highly overrated","should be fired","a dope","is bought and paid for by lobbyists!","will never MAKE AMERICA GREAT AGAIN!","has the worst voting record in the U.S. Senate in many years","is a total lightweight","is scamming Florida","is a dishonest lightweight","is a fraud lightweight","is a big loser","puts out ad that my pilot was a drug dealer- not true, not my pilot!","has the worst record","never even shows up to vote","treated America's ICE officers 'like absolute trash' in order to pass Obama's amnesty","gave amnesty to criminal aliens guilty of 'sex offenses.' DISGRACE!","is just another Washington D.C. politician","has poor work ethic!","is set to be the 'puppet' of the special interest Koch brothers","is the lightweight no show Senator from Florida","is not as smart as Cruz, and may be an even bigger liar","doesn't even show up for votes!","is a choker, and once a choker, always a choker!","not presidential material","looks like a little boy on stage","is very weak on illegal immigration","is a lightweight choker","couldn't even respond properly to President Obama's State of the Union Speech without pouring sweat & chugging water","is a highly overrated politician","cannot be President","only won the debate in the minds of desperate people","is very disloyal to Jeb","is weak on illegal immigration","is VERY weak on illegal immigration","is perfect little puppet","is very disloyal","never made ten cents","is totally controlled","is lazy","has worst voting record in Senate","is very weak on stopping illegal immigration","knows nothing about finance","is VERY weak on immigration","is incapable of making great trade deals","is rarely there to vote on a bill","has one of the worst attendance record in Senate","will allow anyone into the country","truly doesn't have a clue!","is broken, like so much else in our country","came out with another one of their phony polls","should be totally discredited","cannot report the news truthfully","choked like a dog","is a mixed up man who doesn't have a clue. No wonder he lost!","is a total joke, and everyone knows it!","is a disaster candidate who had no guts and choked","begged me for my endorsement four years ago","doesn't know how to win","didn't show his tax return until SEPTEMBER 21, 2012, and then only after being humiliated by Harry R","is one of the dumbest and worst candidates in the history of Republican politics","is so awkward and goofy","blew an election that should have never been lost","had a terrible 'choke' loss to Obama","lost an election that should have easily been won","should not be allowed on TV","is truly one of the dumbest of the talking heads","consistently fumbles & misrepresents poll results","has been so wrong & hates it!","is in a total meltdown","has a weakness that is the greatest recruiting tool of ISIS!!!","continues to report fictious poll numbers","is pushing the GOP around","wants ridiculous debate terms","is a crime and killing machine","is so unbelievably crooked","wants to flood our country with Syrian immigrants that we know little or nothing about","is a liar!","betrayed Bernie voters","is not at all loyal","killed jobs!","is against steelworkers and miners","destroyed jobs and manufacturing","led Obama into bad decisions!","will sell our country down the tubes!","is bought and paid for by Wall Street, lobbyists and special interests","is a DISASTER on foreign policy","is Sad!!","is not qualified","has WEAK leadership","is sooooo guilty","lied to the FBI and to the people of our country","has very bad judgement","is not fit to lead!","is unfit to serve as President","HAS BAD JUDGEMENT!","is a total disgrace!","is the founder of ISIS","is guilty as hell","will NEVER be able to handle the complexities and danger of ISIS","is sellng out America","has such bad judgement","has no sense of markets","may be the most corrupt person ever to seek the presidency","will be a disaster for jobs and the economy!","defrauded America","has a judgement that killed thousands, unleashed ISIS and wrecked the economy.","has really bad judgement and a temperament","is totally unfit to be our president","is unable to answer tough questions!","has a very bad and destructive track record","is not honest!","doesn't even look presidential!","is reading poorly from the telepromter!","no longer has credibility","has zero natural talent","has a very stupid use of e-mails","suffers from plain old bad judgement!","is reckless and dangerous","has zero imagination and even less stamina","can't close the deal with Bernie Sanders","can't close the deal on Crazy Bernie","has bad judgment!","is pushing the false narrative that I want to raise taxes","has ZERO leadership ability","is constantly playing the women's card - it is sad!","is dealing with men who get off the reservation.","is perhaps the most dishonest person to have ever run for the presidency","is one of the all time great enablers!","is unqualified to be president","has been involved in corruption for most of her professional life!","is a major national security risk","lied last week","doesn't have the strength or stamina to be president","is a totally flawed candidate","LIED at the debate last night","does not have the STRENGTH or STAMINA to be President","will be soundly defeated","won't call out radical Islam","is afraid of Obama & the emails","is totally incompetent as a manager and leader","looked lost","is 100% CONTROLLED","did a terrible job","did an absolutely horrible job of securing the border","should be ashamed","failed on the border","should be forced to take an IQ test","doesn't understand what the word demagoguery means","failed at the border","needs a new pair of glasses","just wants to shut down and go home to bed!","totally sold out","has done such a complete fold","has totally given up on his fight for the people","has lost his energy and his strength","flamed out","has no energy left!","is exhausted","just can't go on any longer","is ending really weak","has abandoned his supporters","is selling out!","is lying when he says his disruptors aren't told to go to my events.","would be so easy to beat!","can't even defend his own microphone","did really poorly on television","could not stop Obama (twice)","out of self preservation, is concerned w/ my high poll #s","loses a fortune","doesn't have a clue","is trying to destroy Israel with all his bad moves","is living in a world of the make believe!","is the worst president in U.S. history!","looks and sounds so ridiculous","spends so much time speaking of the so-called Carbon footprint, and yet he flies all the way to Hawaii on a massive old 747","has a horrible attitude","is just so bad!","is hollowing out our military","is doing a terrible job","is doing many bad things behind our backs","is controlled by Mexican government?","has guests are stacked for Crooked Hillary!","is getting more and more biased","is so negative, getting even worse","is working hard to make me look as bad as possible","paid a fortune for an Iowa Poll, which shows me in first place over Cruz by 13%, 33% to 20% - then doesn't use it","is totally one-sided and biased against me that it is becoming boring","does not cover me accurately","has a major inferiority complex","is a dopey clown","has knowingly committed fraud","wants to control our U.S. politicians with daddy's money","is a really stupid talking head","is an embarrassed loser","lost all credibility","couldn't get elected dog catcher","forgot to mention my phenomenal biz success rate","didn't get the right gene.","reminds me of a spoiled brat without a properly functioning brain","is a third rate talent","is a total loser!","has no power in iowa","is so totally dishonest!","is unfair and biased","will always take a good story about me and make it bad","is a disgusting fraud","is laughing at the @nytimes for the lame hit piece they did on me and women","wrote yet another hit piece on me","is always trying to belittle","has lost its way!","never even calls to fact check","knowingly writes lies","allows dishonest writers to totally fabricate stories","should focus on fair and balanced reporting","made all bad decisions over the last decade","is falling apart","is always looking for a hit to bring them back into relevancy—ain't working","is now irrelevant","is one of the dumbest people in politics","has no talent, no TV persona","is one of the least talented people on television","is a totally biased loser who doesn't have a clue","will be gone soon","is really hard to watch, has zero talent",", you have no idea what my strategy on ISIS is","is so average in so many ways!","is always complaining about Trump","is so average in every way","is very bad at math","should take another eleven day 'unscheduled' vacation","is not very good or professional","really bombed tonight","is getting ready to treat me unfairly","is a total low life","will fade fast","is a major sleaze and buffoon","got thrown off of TV by NBC","has done nothing","is incapable of doing anything.","has failed miserably","is doing a lousy job in taking care of our Vets","let us down","graduated last in their class","should be defeated in the primaries","has gone really hostile ever since I said I won't do or watch the show anymore","doesn't have much power or insight!","has gone wild with hate","has the absolutely worst anti-Trump talking heads on his show","is a hater & racist","has to stop working to be so politically correct","asked if he could have pictures taken with me. I said fine. He then trashes on air!","is highly neurotic","was the WORST abuser of woman in U.S. political history","a gigantic hypocrite","was called a racist","DEMONSTRATED A PENCHANT FOR SEXISM","is so inappropriate","won't survive","has lost all credibility","endorsed a candidate who can't win","is desperate","begged me for ads","has been run into the ground","will be dead in 2 years","is so biased it is disgusting","treats me so badly","is incapable of understanding foreign policy","should know that the pyramids built for grain storage - don't people get it?","has never created a job in his life","isn't smart enough to know what's going on at the border","is not looking tough!","is not looking smart","is not looking good","totally lost control of illegal immigration, even with criminals","looks more and more like a paper tiger","is letting criminals knowingly stay in our country","is just a 3rd rate 'gotcha' guy!","is kooky","is totally ineffective","is a low-level degenerate","should drop out of the race-stop wasting time & money","really went wacko today","can't function under pressure","is not very presidential","has NO path to victory","can never beat Hilary Clinton","is mathematically dead and totally desperate","hates New York","can't win with the voters so he has to sell himself to the bosses","can't get votes (I am millions ahead of him)","has to get his delegates from the Republican bosses","attacked New Yorkers and New York values- we don't forget!","has accomplished absolutely nothing","does not have the right 'temperment' to be President","is the biggest liar in politics!","is acomplete & total liar","holds the Bible high and then lies and misrepresents the facts!","lies so much and is so dishonest","should be immediately disqualified in Iowa","told thousands of caucusgoers (voters) that Trump was strongly in favor of ObamaCare and 'choice' - a total lie!","sent out a VOTER VIOLATION certificate to thousands of voters","didn't win Iowa, he illegally stole it","can't even get a Senator like @BenSasse, who is easy, to endorse him","will do anything to stay at the trough","is dropping like a rock","is in bed w/ Wall St.","is spending $millions on ads paid for by his N.Y. bosses","says one thing for money, does another for votes","is the ultimate hypocrite","did not list on his personal disclosure form personally guaranteed loans from banks. They own him!","is not much of a reformer","would speak behind my back, get caught, and then deny it","should not make statements behind closed doors to his bosses","made many bad calls","is one of the most overrated political pundits","is wrong almost all of the time","should be thrown off Fox News","is boring and totally biased","is a major lightweight with no credibility","has no honor!","was ran out of the race like a little boy","should respect me","is a dumb mouthpiece","got zero against me- no cred!","had zero in his presidential run before dropping out in disgrace","embarrasses himself with endorsement of Bush","embarrassed himself with his failed run for President","is so easy to beat!","is low energy","wants to look cool, but it's far too late","has no clue","is spending a fortune of special interest against me in SC","is desperate and SAD!","gave up and enlisted Mommy and his brother","is by far the weakest of the lot","has gone nasty with lies","is a pathetic figure!","spent a fortune of special interest money on a Super Bowl ad","has zero communication skills","had to bring in mommy to take a slap at me","should go home and relax!","is a total embarrassment to himself and his family","is a basket case","has been confused for forty years","is bad on women's health issues","is miserable","just doesn't get it","will never secure the border","will NEVER Make America Great Again","has gone off the deep end","misrepresents my positions!","is rapidly fading","is so off the rails","is a waste of time","just doesn't know about winning","is now in total freefall","is one of the dumber bloggers","is really boring, slow, lethargic","wouldn't know the truth if it hit him in the face","has paid ZERO respect to the great police and law enforcement professionals","is a sleazebag","is not only breaking the spirit of the law but the law itself","is spending more time doing a forensic analysis of Melania's speech than the FBI spent on Hillary's emails","is trying their absolute best to depict a star in a tweet as the Star of David rather than a Sheriff's Star, or plain star!","is so totally biased","is on a new phony kick about my management style","has not covered my long-shot great finish in Iowa fairly","will not report the highly respected new national poll that just came out","is rambling and overly flamboyant","begged my people for a job","is virtually incompetent","allowed Crooked Hillary to get away with 'murder'","is totally rigged and corrupt!","bombed last night!","is very racist!","has a nasty mouth","is one of the least productive U.S. Senators","gets nothing done","does nothing to help!","didn’t have the guts to run for POTUS","has a career that is totally based on a lie","wrote letter to me begging for forgiveness","selfishly opposed to me!","should resign","is totally biased against me","was going off the air until I came along","knows so little about politics","will be fired like a dog","doesn't have a natural instinct for politics","registers ZERO in the polls","couldn't be elected dog catcher if he ran again","spent $1,000 to register in New Hampshire & dropped out the next day. Such a waste!","registered at less than 1 percent in the polls","is such a mess","knows nothing about me","did a terrible job against me","will lead to at least partial world destruction","is a catastrophe","made one of the dumbest & most dangerous misjudgments ever","poses a direct national security threat","wants $120,000 to make a boring speech","covers me very inaccurately","did a 1 hour hit job on me today","is totally out of control","treats me very badly","is trying hard to disguise their massive Muslim problem","will drop like a rock in the polls","is good for Mexico!","doesn't have what it takes","can't debate","fell right into President Obama's trap on ObamaCare","came in dead last","is so irrelevant to the race","is uncomfortable looking","sucks and is are bad for U.S.A.","wants to continue our bad trade deals","wasted a lot of time and money","is weak and totally conflicted","is dumb as a rock","did a terrible job of ticket distrbution","won't even call it what it is - RADICAL ISLAM!","has zero credibility","is very dumb and failing","is a mental basketcase","always seems to be crying"]
    r = rand(0..arr.count-1)

    loser + " " + arr[r]

  end

end
