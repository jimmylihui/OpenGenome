




cd ..
cd ..

python -m train experiment=hg38/genomic_structure \
    model.d_model=256 \
    train.pretrained_model_path=experiment/genomic_structure/genomic_structure_bert2.sh \
    dataset.dataset_name=h1esc \
    optimizer.lr=1e-4 \
    wandb.mode=offline \
    dataset.tokenizer_name=bert2 \
    model.layer._name_=bert2 \
    dataset.max_length=6000 \
    dataset.total_size=1000 \
    trainer.devices=4 \
    dataset.batch_size=1 \
    train.global_batch_size=15 \
    wandb.id=Genomic_structure_h1esc_bert2_6k \
    callbacks.early_stopping.patience=10 \
    trainer.max_epochs=1000 \
    task.loss=genomic_structure_h1esc_loss \
    task.metrics=genomic_structure_h1esc_corr \
    callbacks.early_stopping.monitor=val/genomic_structure_h1esc_corr \
    callbacks.early_stopping.mode=max \
    train.monitor=val/genomic_structure_h1esc_corr \
    callbacks.model_checkpoint.mode=max \
    decoder._name_=sequence_structure \
    dataset.return_mask=False \
    dataset.dataset_name=h1esc 

