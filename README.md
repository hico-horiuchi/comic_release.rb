comic_release.rb
================
�R�~�b�N�V���̔������𒲂ׂ�Ruby�X�N���v�g�ł��B
���݂́A[comiclist.jp](http://comiclist.jp/)����A�����擾���Ă��܂��B

����N����
--------
	> gem install bundler
	> bundle install

�N�����@
--------
	> ruby comic_release.rb list.csv
	
���j�b�g�e�X�g
--------
	> rake spec

�ϐ��ꗗ
--------
+ Comic
	+ `title` : �^�C�g��
	+ `volume` : ����
	+ `release_date` : ������
	+ `is_release_decided` : �����t���O
+ Shelf
	+ `comics` : Comic�C���X�^���X���[�z��

���\�b�h�ꗗ
------------
+ Comic
	+ `encorded_url` : title��volume����AUTF-8�G���R�[�h�Ō����p��URL�𐶐��B
	+ `resolve_release_date!` : URL����HTML���擾���A���K�\����p���Ĕ��������擾�B
	+ `to_s` : �o�͕�����𐶐�
+ Shelf
	+ `import` : �^����ꂽ�p�X����CSV��ǂݍ��݁A�s���Ƃ�add���\�b�h�����s�B
	+ `add` : Comic�C���X�^���X���쐬���Acomics�z��֎��[
	+ `each` : comics�z��̒��g����ÂԂ��B
	+ `resolve_books_attributes` : comics�z��Ɏ��[����Ă���comic�C���X�^���X���ׂĂ�resolv_release_date!���\�b�h�����s�B
	
�N���X�}
--------
![class.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/class.png)

�V�[�P���X�}
------------
![sequence.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/sequence.png)
